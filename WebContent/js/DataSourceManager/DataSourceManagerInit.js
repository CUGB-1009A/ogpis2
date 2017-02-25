$(function() {
	$("#dimensionValueList").on("click", "div>div input[type='checkbox']",
			function() {
				if (this.checked) {
					$(this).data("submit", "yes");
					$(this).parent().next().show().data("submit", "yes");
				} else {
					$(this).data("submit", "no");
					$(this).parent().next().hide().data("submit", "no");
				}
			});
	$("#realDSList").on("click", "input[type='checkbox']", function() {
		if ($(this).prop("checked")) {
			$(this).data("submit", "yes");
			$(this).siblings("input").show().data("submit", "yes");
		} else {
			$(this).data("submit", "no");
			$(this).siblings("input").hide().data("submit", "no");
		}
	});
	$("#dimensionList").on("click", "div input[type='checkbox']", function() {
		if ($(this).prop("checked")) {
			$(this).data("submit", "yes");
			$(this).next().nextAll().show();
			$(this).siblings("select").data("submit", "yes");
		} else {
			$(this).data("submit", "no");
			$(this).next().nextAll().hide();
			$(this).siblings("select").data("submit", "no");
		}
	})
})
