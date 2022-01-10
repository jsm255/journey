/**
 * 
 */

function toggleTable(event){
   	const id = "#" + event.currentTarget.getAttribute("id") + "_table";
   	$(id).toggle();
}
   	
$("#range").change(e => {
   	const getter = e.target.value;
   	console.log(getter);
   	const span = document.createElement("span");
   	$(span).attr("id", "child");
   	$(span).append(document.createTextNode(getter+"점"));
   	$("#child").replaceWith(span);
});

//function modifyReview