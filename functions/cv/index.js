// This is your Azure Function - it runs when someone calls the API endpoint

module.exports = async function (context, req) {
    
    // This is your CV data as a JavaScript object
    const cv = {
        name: "Tony Fowler",
        title: "Solutions Architect",
        tagline: "30 Years Experience | Azure Cloud Specialist",
        contact: {
            email: "tony@foxmax.co.uk",
            github: "github.com/butcheroo"
        },
        experience: [
            {
                period: "2012 - Present",
                focus: "Azure Cloud Architecture",
                description: "Leading cloud migrations, greenfield projects and POCs through to MVP on Azure"
            },
            {
                period: "1994 - 2012",
                focus: "Solutions Architecture",
                description: "18 years of enterprise architecture across multiple industries"
            }
        ],
        skills: [
            "Azure",
            "Cloud Migration", 
            "Solutions Architecture",
            "Stakeholder Management",
            "Greenfield Projects",
            "POC to MVP",
            "Technical Leadership",
            "Terraform",
            "GitHub",
            "DevOps"
        ],
        openTo: "New projects and collaborations"
    };

    // Send the CV data back as JSON
    context.res = {
        status: 200,
        headers: {
            "Content-Type": "application/json",
            // This allows your portfolio website to call this API
            "Access-Control-Allow-Origin": "*"
        },
        body: cv
    };
};