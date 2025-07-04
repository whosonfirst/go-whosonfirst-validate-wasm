window.addEventListener("load", function load(event){

    var raw = document.getElementById("raw");
    var feedback = document.getElementById("feedback");
    
    var do_export = function(){

	feedback.innerText = ""

	try {
	    var f = JSON.parse(raw.innerText);
	} catch(err) {
	    feedback.innerText = "Failed to parse feature: " + err;
	    return;
	}

	var str_f = JSON.stringify(f);
	
	validate_feature(str_f).then(rsp => {
	    feedback.innerText = "Document is valid.";
	}).catch(err => {
	    feedback.innerText = "Failed to validate feature: " + err;
	});
    };
    
    var init = function(){

	var btn = document.getElementById("submit");

	if (! btn){
	    console.log("Unable to load submit button");
	    return;
	}

	btn.onclick = function(){
	    do_export();
	    return false;
	};

	btn.innerText = "Validate";	
	btn.removeAttribute("disabled");
    };
    
    sfomuseum.wasm.fetch("/wasm/validate_feature.wasm").then(rsp => {
	init();	
    });
    
});
