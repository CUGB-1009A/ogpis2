<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="width:30%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			原始数据集：<br>
			<c:forEach items="${originDataCollections}" var="item">
						<a href="javascript:dataShow('${item.id}')">${item.dataCollectionName}</a><br>
			</c:forEach>
		</div>
	</div>
</div>
<div style="width:40%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px;float:left">
			我的数据集：<br>
			<div id="unshared" style="width:100%;height:50%;float:left">
				未共享：<br>
					<c:forEach items="${selfDataCollections}" var="item">
								<c:if test="${!item.shared}">
									<span id="${item.id}"><a href="javascript:dataShow('${item.id}')">${item.dataCollectionName}</a>
									<button onclick="share('${item.id}')">共享</button>
									<button onclick="deleteUnshared('${item.id}')">删除</button><br></span>
								</c:if>
					</c:forEach>
			</div>
			<div id="shared" style="width:100%;height:50%;float:left">
				已共享：<br>
					<c:forEach items="${selfDataCollections}" var="item">
							<c:if test="${item.shared}">
							<span id="${item.id}">
								<a href="javascript:dataShow('${item.id}')">${item.dataCollectionName}</a><button onclick="disshare('${item.id}')">取消共享</button><br></span>
							</c:if>
					</c:forEach>
			</div>
		</div>
	</div>
</div>
<div style="width:30%;height:40%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			共享数据集:<br>
				<c:forEach items="${otherssharedDataCollections}" var="item">
						<a href="javascript:dataShow('${item.id}')">${item.dataCollectionName}</a><br>
				</c:forEach>
		</div>
	</div>
</div>

<div style="width:40%;height:60%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			<script type="text/javascript">
				insertReport('AF', "Rebar='main'");/*  */
			</script>
		</div>	
	</div>
</div>

<div style="width:60%;height:60%;float:left;">
	<div style="width:100%;height:100%;float:left">
		<div style="padding:10px">
			<div id="historyDataChart" style="width:100%;height:100%;">
			
			</div>
		</div>
	</div>
</div>
