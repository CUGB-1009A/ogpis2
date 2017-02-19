package com.ogpis.forecast;

public class LES {

	 public static boolean svd(double[][] a, int m, int n, double[] b, double[] x)
     /*
	        a：方程系数矩阵，m×n
	        m：方程行数
	        n：未知数数量
	        b：方程右侧系数,m个元素，调用者分配内存
	        x：方程的解，n个元素，调用者分配内存
         返回值：true拟合成功，false拟合过程出错
     */
     {
         double[][] u;
         double[] w;
         double[][] v;
         double wmax, wmin;
         int i, j;
         u = new double[m + 1][n + 1];
         v = new double[n + 1][n + 1];
         w = new double[n + 1];

         for (i = 1; i <= n; ++i)
             x[i] = 0;

         for (i = 1; i <= m; ++i)
             for (j = 1; j <= n; ++j)
                 u[i][j] = a[i][j];
         if (svdcmp(u, m, n, w, v) == false)
             return false;

         wmax = 0.0;
         for (j = 1; j <= n; ++j)
             if (w[j] > wmax)
                 wmax = w[j];
         wmin = wmax * 1.0e-6;
         for (j = 1; j <= n; ++j)
             if (w[j] < wmin)
                 w[j] = 0.0;
         svbksb(u, w, v, m, n, b, x);
         return true;
     }
     private static boolean svdcmp(double[][] a, int m, int n, double[] w, double[][] v)
     /*
         a：方程系数矩阵,svd转换后的结果也保存在a中
         m：方程行数
         n：未知数数量
         w：svd转换后的对角矩阵w，n个元素
         v：svd转换后的方阵v，n×n元素
     */
     {
         int i, its, jj, k, l = 1, nm = 1, j, flag;   
         double anorm, c, f, g, h, s, scale, x, y, z;

         double[] rv1;
         rv1 = new double[n + 1];

         g = scale = anorm = 0.0;
         for (i = 1; i <= n; i++)
         {
             l = i + 1;
             rv1[i] = scale * g;
             g = s = scale = 0.0;
             if (i <= m)
             {
                 for (k = i; k <= m; k++)
                     scale += (double)Math.abs(a[k][i]);
                 if (scale != 0)
                 {
                     for (k = i; k <= m; k++)
                     {
                         a[k][i] /= scale;
                         s += a[k][i] * a[k][i];
                     }
                     f = a[i][i];
                     g = -SIGN(Math.sqrt(s), f);
                     h = f * g - s;
                     a[i][i] = f - g;
                     for (j = l; j <= n; j++)
                     {
                         for (s = 0.0, k = i; k <= m; k++)
                             s += a[k][i] * a[k][j];
                         f = s / h;
                         for (k = i; k <= m; k++)
                             a[k][j] += f * a[k][i];
                     }
                     for (k = i; k <= m; k++)
                         a[k][i] *= scale;
                 }
             }
             w[i] = scale * g;
             g = s = scale = 0.0;
             if (i <= m && i != n)
             {
                 for (k = l; k <= n; k++)
                     scale += (double)Math.abs(a[i][k]);
                 if (scale != 0)
                 {
                     for (k = l; k <= n; k++)
                     {
                         a[i][k] /= scale;
                         s += a[i][k] * a[i][k];
                     }
                     f = a[i][l];
                     g = -SIGN(Math.sqrt(s), f);
                     h = f * g - s;
                     a[i][l] = f - g;
                     for (k = l; k <= n; k++)
                         rv1[k] = a[i][k] / h;
                     for (j = l; j <= m; j++)
                     {
                         for (s = 0.0, k = l; k <= n; k++)
                             s += a[j][k] * a[i][k];
                         for (k = l; k <= n; k++)
                             a[j][k] += s * rv1[k];
                     }
                     for (k = l; k <= n; k++)
                         a[i][k] *= scale;
                 }
             }
             if ((Math.abs(w[i]) + Math.abs(rv1[i])) >= anorm)
                 anorm = (double)(Math.abs(w[i]) + Math.abs(rv1[i]));
         }
         for (i = n; i >= 1; i--)
         {
             if (i < n)
             {
                 if (g != 0.0)
                 {
                     for (j = l; j <= n; j++)
                         v[j][i] = (a[i][j] / a[i][l]) / g;
                     for (j = l; j <= n; j++)
                     {
                         for (s = 0.0, k = l; k <= n; k++)
                             s += a[i][k] * v[k][j];
                         for (k = l; k <= n; k++)
                             v[k][j] += s * v[k][i];
                     }
                 }
                 for (j = l; j <= n; j++)
                     v[i][j] = v[j][i] = 0.0;
             }
             v[i][i] = 1.0;
             g = rv1[i];
             l = i;
         }
         for (i = Math.min(m, n); i >= 1; i--)
         {
             l = i + 1;
             g = w[i];
             for (j = l; j <= n; j++)
                 a[i][j] = 0.0;
             if (g != 0.0)
             {
                 g = 1.0 / g;
                 for (j = l; j <= n; j++)
                 {
                     for (s = 0.0, k = l; k <= m; k++)
                         s += a[k][i] * a[k][j];
                     f = (s / a[i][i]) * g;
                     for (k = i; k <= m; k++)
                         a[k][j] += f * a[k][i];
                 }
                 for (j = i; j <= m; j++)
                     a[j][i] *= g;
             }
             else
                 for (j = i; j <= m; j++)
                     a[j][i] = 0.0;
             ++a[i][i];
         }
         for (k = n; k >= 1; k--)
         {
             for (its = 1; its <= 100; its++)
             {
                 flag = 1;
                 for (l = k; l >= 1; l--)
                 {
                     nm = l - 1;
                     if ((double)(Math.abs(rv1[l]) + anorm) == anorm)
                     {
                         flag = 0;
                         break;
                     }
                     if ((double)(Math.abs(w[nm]) + anorm) == anorm)
                         break;
                 }
                 if (flag != 0)
                 {
                     c = 0.0;
                     s = 1.0;
                     for (i = l; i <= k; i++)
                     {
                         f = s * rv1[i];
                         rv1[i] = c * rv1[i];
                         if ((double)(Math.abs(f) + anorm) == anorm)
                             break;
                         g = w[i];
                         h = pythag(f, g);
                         w[i] = h;
                         h = 1.0 / h;
                         c = g * h;
                         s = -f * h;
                         for (j = 1; j <= m; j++)
                         {
                             y = a[j][nm];
                             z = a[j][i];
                             a[j][nm] = y * c + z * s;
                             a[j][i] = z * c - y * s;
                         }
                     }
                 }
                 z = w[k];
                 if (l == k)
                 {
                     if (z < 0.0)
                     {
                         w[k] = -z;
                         for (j = 1; j <= n; j++)
                             v[j][k] = -v[j][k];
                     }
                     break;
                 }
                 if (its == 100)
                 {
                     //System.Console.WriteLine("Error");
                     return false;
                 }
                 x = w[l];
                 nm = k - 1;
                 y = w[nm];
                 g = rv1[nm];
                 h = rv1[k];
                 f = ((y - z) * (y + z) + (g - h) * (g + h)) / (2.0 * h * y);
                 g = pythag(f, 1.0);
                 f = ((x - z) * (x + z) + h * ((y / (f + SIGN(g, f))) - h)) / x;
                 c = s = 1.0;
                 for (j = l; j <= nm; j++)
                 {
                     i = j + 1;
                     g = rv1[i];
                     y = w[i];
                     h = s * g;
                     g = c * g;
                     z = pythag(f, h);
                     rv1[j] = z;
                     c = f / z;
                     s = h / z;
                     f = x * c + g * s;
                     g = g * c - x * s;
                     h = y * s;
                     y *= c;
                     for (jj = 1; jj <= n; jj++)
                     {
                         x = v[jj][j];
                         z = v[jj][i];
                         v[jj][j] = x * c + z * s;
                         v[jj][i] = z * c - x * s;
                     }
                     z = pythag(f, h);
                     w[j] = z;
                     if (z != 0.0)
                     {
                         z = 1.0 / z;
                         c = f * z;
                         s = h * z;
                     }
                     f = c * g + s * y;
                     x = c * y - s * g;
                     for (jj = 1; jj <= m; jj++)
                     {
                         y = a[jj][j];
                         z = a[jj][i];
                         a[jj][j] = y * c + z * s;
                         a[jj][i] = z * c - y * s;
                     }
                 }
                 rv1[l] = 0.0;
                 rv1[k] = f;
                 w[k] = x;
             }
         }
         return true;
     }
     private static void svbksb(double[][] u, double[] w, double[][] v, int m, int n, double[] b, double[] x)
     /*
         u：转换后的u方阵，（n+1）×（n＋1）
         w：对角矩阵系数，n+1
         b：方程右侧系数
         x：方程的解
      */
     {
         int i, j, k;
         double[] temp;
         double s;
         temp = new double[n + 1];
         for (j = 1; j <= n; ++j)
         {
             s = 0.0;
             if (w[j] != 0)
             {
                 for (i = 1; i <= m; ++i)
                     s += u[i][j] * b[i];
                 s /= w[j];
             }
             temp[j] = s;
         }
         for (j = 1; j <= n; ++j)
         {
             s = 0.0;
             for (k = 1; k <= n; ++k)
                 s += v[j][k] * temp[k];
             x[j] = s;
         }
     }
     private static double pythag(double a, double b)
     {
         double absa, absb;
         absa = Math.abs(a);
         absb = Math.abs(b);
         if (absa > absb)
             return absa * Math.sqrt(1.0 + SQR(absb / absa));
         else
             return absb == 0.0 ? 0.0 : absb * Math.sqrt(1.0 + SQR(absa / absb));
     }
     private static double SQR(double a)
     {
         if (a == 0.0)
             return 0.0;
         else
             return a * a;
     }
     private static double SIGN(double a, double b)
     {
         if (b >= 0)
             return Math.abs(a);
         else
             return -Math.abs(a);
     }
}
