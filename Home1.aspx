<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/masterbase.master" CodeBehind="Home1.aspx.cs" Inherits="WebApplication5.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        * {
            box-sizing: border-box;
        }
        .about {
            padding: 50px 20px;
            background: #f9f9f9;
            text-align: center;
        }

        .about h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #0c3b66;
            font-family: 'Pacifico', cursive;
        }

        .about p {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: #333;
            font-family: 'Roboto', sans-serif;
            max-width: 800px;
            margin: 0 auto 20px;
        }

        .team {
            margin-top: 50px;
        }

        .team h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #007bff;
        }

        .team-members {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .team-member {
            max-width: 300px;
            text-align: center;
            margin: 20px;
        }

        .team-member img {
            width: 100%;
            height: auto;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        .team-member h4 {
            font-size: 1.5rem;
            margin-bottom: 5px;
            color: #0c3b66;
            font-family: 'Pacifico', cursive;
        }

        .team-member p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 10px;
            font-family: 'Roboto', sans-serif;
        }
        img, video {
            vertical-align: middle;
            max-width: 100%;
            height: auto;
        }

        /* Combined Hero & Slideshow Styles */
        .hero-slideshow {
            position: relative;
            text-align: center;
            color: white;
        }

        .slideshow-container {
            max-width: 100%;
            position: relative;
            margin: auto;
        }

        .slide-video {
            width: 100%;
            height: 700px;
    object-fit: cover;
        }
        .slide-video::-webkit-media-controls {
    display: none !important;
}

        /* Hero Content Styling */
        .hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            padding: 20px;
            border-radius: 10px;
        }

        .hero-content h2 {
    font-size: 3.5rem;
    margin-bottom: 20px;
    font-family: 'Pacifico', cursive;
    color: white; /* Neutral color that contrasts well */
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7); /* Soft shadow for readability */
}

.hero-content p {
    font-family: 'Roboto', sans-serif;
    font-size: 1.6rem;
    margin-bottom: 30px;
    color: white; /* Neutral color that contrasts well */
    text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7); /* Soft shadow for readability */
}


       

/* Button hover effect */
.hero-content button:hover {
    background: linear-gradient(145deg, #555, #333); /* Inverted gradient for hover */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.4); /* Stronger shadow on hover */
    transform: translateY(-2px); /* Slight lift effect */
}

/* Button active effect */
.hero-content button:active {
    background: linear-gradient(145deg, #333, #555); /* Inverted gradient for active */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Less shadow when clicked */
    transform: translateY(1px); /* Subtle push effect */
}


        /* Next & Previous Buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            padding: 16px;
            margin-top: -22px;
            color: white;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }
        .prev {
    left: 10px; /* Adjusted for better alignment */
}
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: #f1f1f1;
            color: black;
        }

        /* Services Section Styling */
        .service img {
            width: 100%;
            height: auto;
        }
        .services {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    padding: 30px 20px;
    background: #f4f4f4; /* Slightly off-white background for a softer look */
    border-top: 5px solid #007bff; /* Blue border for a vibrant touch */
}

.service {
    text-align: center;
    width: 100%;
    max-width: 320px;
    margin: 20px;
    border-radius: 10px; /* Rounded corners */
    overflow: hidden; /* Ensures content doesn't spill outside the border-radius */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for a 3D effect */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transition for hover effects */
}

.service:hover {
    transform: scale(1.05); /* Slightly enlarge on hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* More pronounced shadow on hover */
}

.service img {
    width: 100%;
    height: 200px; /* Fixed height for consistency */
    object-fit: cover; /* Ensures images cover the area without distortion */
    border-bottom: 5px solid #007bff; /* Blue border below image for visual interest */
}

.service h3 {
    margin: 15px 0;
    font-family: 'Roboto', sans-serif; /* Stylish font for headings */
    color: #333; /* Dark grey color for better readability */
}

.service p {
    font-family: 'Roboto', sans-serif; /* Clean font for paragraphs */
    color: #555; /* Slightly lighter grey for text */
    padding: 0 15px; /* Padding for better readability */
}


        /* Destinations Section Styling */
        .destinations {
            padding: 20px;
            background: #f9f9f9;
        }

        .destination {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

            .destination-item {
        position: relative;
        text-align: center;
        width: 100%;
        max-width: 300px;
        margin-bottom: 30px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
        background: white;
    }

    .destination-item img {
        width: 100%;
        height: auto;
        transition: transform 0.3s ease;
    }

    .destination-item h4 {
        margin: 10px 0;
        font-size: 1.5rem;
        color: #333;
        font-family: 'Roboto', sans-serif;
    }

    .destination-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    .destination-item:hover img {
        transform: scale(1.05);
    }

    /* Add a subtle gradient overlay */
    .destination-item::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0));
        z-index: 1;
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .destination-item:hover::before {
        opacity: 1;
    }

    .destination-item h4 {
        position: relative;
        z-index: 2;
        margin-top: -40px;
        padding: 10px;
        background: rgba(255, 255, 255, 1);
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

        /* Testimonials Section Styling */
        .testimonials {
            padding: 20px;
            background: #fff;
        }

        .testimonial {
            margin-bottom: 20px;
            text-align: center;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .hero-content h2 {
                font-size: 1.8rem;
            }

            .hero-content p {
                font-size: 0.9rem;
            }

            .hero-content button {
                font-size: 0.9rem;
            }

            .services, .destinations {
                flex-direction: column;
                align-items: center;
            }

            .service, .destination-item {
                width: 80%;
            }
        }

        @media (max-width: 480px) {
            .hero-content h2 {
                font-size: 1.5rem;
            }

            .hero-content p {
                font-size: 0.8rem;
            }

            .hero-content button {
                font-size: 0.8rem;
            }
        }
    </style>
    
    <title>Travel Agency Pathein</title>

    <!-- Hero Section with Video Slideshow -->
    <section class="hero-slideshow">
        <div class="slideshow-container">
            <div class="mySlides">
                <video class="slide-video" autoplay muted loop>
                    <source src="<%= ResolveUrl("~/Videos/bg3.mp4") %>" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="mySlides">
                <video class="slide-video" autoplay muted loop>
                    <source src="<%= ResolveUrl("~/Videos/bg2.mp4") %>" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="mySlides">
                <video class="slide-video" autoplay muted loop>
                    <source src="<%= ResolveUrl("~/Videos/bg1.mp4") %>" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>

        <div class="hero-content">
            <h2>Discover Your Next Adventure</h2>
            <p>Explore the world with our exclusive travel packages and tours</p>
        </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <h2>Welcome to Travel Agency Pathein</h2>
        <p>
            At Travel Agency Pathein, travel is more than just visiting new places—it's about creating unforgettable experiences.
            Whether you're seeking a tranquil escape to our beautiful beaches or an adventurous journey through Myanmar’s stunning
            landscapes, we customize each experience to fulfill your unique desires.
        </p>
        
        <h3>Vision</h3>
        <p>To be the premier travel agency in Pathein, offering high-quality travel services that inspire and enhance the lives of our clients.</p>

        <h3>Main Mission</h3>
        <p>
            Our mission is to deliver exceptional travel experiences by offering personalized travel packages, ensuring seamless service, 
            and maintaining a commitment to exceeding our clients' expectations.
        </p>
    </section>

   

    <!-- JavaScript for Slideshow -->
    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.getElementsByClassName("mySlides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 5000); // Change slide every 5 seconds
        }

        function plusSlides(n) {
            slideIndex += n;
            let slides = document.getElementsByClassName("mySlides");
            if (slideIndex > slides.length) { slideIndex = 1 }
            if (slideIndex < 1) { slideIndex = slides.length }
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }
    </script>
</asp:Content>  