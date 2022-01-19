/**
 * 
 */

async function uploadFile(){
	event.preventDefault();
	
	let fileReqDto = {
		title : document.querySelector("#title").value,
		countryName : document.querySelector("#countryName"),
		range: document.querySelector("#range"),
		content: document.querySelector("#content"),
		image: document.querySelector("#image")
	}
	
	let response = await fetch("/FileUploadServlet", {
		method: "post",
		body: JSON.stringify(fileReqDto),
		headers: {
			"Content-Type": "application/json; charset=utf-8"
		}
	});
}