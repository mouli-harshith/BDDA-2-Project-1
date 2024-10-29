CREATE TABLE DigitalMarketingService (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Table for service types (e.g., Instagram Marketing, Facebook Ads)
CREATE TABLE ServiceType (
    TypeID INT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL,
    Description TEXT,
    ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES DigitalMarketingService(ServiceID)
);

-- Table for clients
CREATE TABLE Client (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255),
    ServiceID INT,
    FOREIGN KEY (ServiceID) REFERENCES DigitalMarketingService(ServiceID)
);

-- Table for marketing campaigns
CREATE TABLE Campaign (
    CampaignID INT PRIMARY KEY,
    CampaignName VARCHAR(255) NOT NULL,
    Budget DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    ClientID INT,
    ServiceID INT,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES DigitalMarketingService(ServiceID)
);

-- Table for campaign analytics
CREATE TABLE Analytics (
    AnalyticsID INT PRIMARY KEY,
    Metrics VARCHAR(255),
    ReportDate DATE,
    CampaignID INT,
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID)
);

-- Table for platforms (e.g., Instagram, Facebook)
CREATE TABLE Platform (
    PlatformID INT PRIMARY KEY,
    PlatformName VARCHAR(255) NOT NULL,
    CampaignID INT,
    FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID)
);

-- Table for social media platforms (Instagram, Facebook, Twitter, YouTube)
CREATE TABLE SocialMediaPlatform (
    SocialPlatformID INT PRIMARY KEY,
    PlatformName VARCHAR(255) NOT NULL,
    PlatformType VARCHAR(255)
);

-- Specific table for Instagram services
CREATE TABLE InstagramService (
    InstagramServiceID INT PRIMARY KEY,
    SocialPlatformID INT,
    FOREIGN KEY (SocialPlatformID) REFERENCES SocialMediaPlatform(SocialPlatformID)
);

-- Specific table for Facebook services
CREATE TABLE FacebookService (
    FacebookServiceID INT PRIMARY KEY,
    SocialPlatformID INT,
    FOREIGN KEY (SocialPlatformID) REFERENCES SocialMediaPlatform(SocialPlatformID)
);

-- Specific table for Twitter services
CREATE TABLE TwitterService (
    TwitterServiceID INT PRIMARY KEY,
    SocialPlatformID INT,
    FOREIGN KEY (SocialPlatformID) REFERENCES SocialMediaPlatform(SocialPlatformID)
);

-- Specific table for YouTube services
CREATE TABLE YouTubeService (
    YouTubeServiceID INT PRIMARY KEY,
    SocialPlatformID INT,
    FOREIGN KEY (SocialPlatformID) REFERENCES SocialMediaPlatform(SocialPlatformID)
);

-- Insert data into DigitalMarketingService
INSERT INTO DigitalMarketingService (ServiceID, ServiceName, Description) VALUES
    (1, 'Social Media Management', 'Handles social media presence for businesses'),
    (2, 'Content Marketing', 'Creates and distributes valuable content'),
    (3, 'SEO Optimization', 'Improves search engine ranking');

-- Insert data into ServiceType
INSERT INTO ServiceType (TypeID, TypeName, Description, ServiceID) VALUES
    (101, 'Instagram Marketing', 'Posts, Stories, Ads', 1),
    (102, 'Facebook Ads', 'Sponsored posts and targeted ads', 1),
    (103, 'Twitter Promotion', 'Engagement and trends', 1),
    (104, 'YouTube Ads', 'Video ads for products', 2);

-- Insert data into Client
INSERT INTO Client (ClientID, ClientName, ContactInfo, ServiceID) VALUES
    (201, 'TechCorp', 'contact@techcorp.com', 1),
    (202, 'GreenHome Solutions', 'info@greenhome.com', 2),
    (203, 'PetLand', 'support@petland.com', 3);

-- Insert data into Campaign
INSERT INTO Campaign (CampaignID, CampaignName, Budget, StartDate, EndDate, ClientID, ServiceID) VALUES
    (301, 'Holiday Promo', 15000, '2023-11-01', '2023-12-31', 201, 1),
    (302, 'Spring Sale', 8000, '2024-03-01', '2024-03-31', 202, 2),
    (303, 'New Year SEO Push', 5000, '2023-12-01', '2024-01-31', 203, 3);

-- Insert data into Analytics
INSERT INTO Analytics (AnalyticsID, Metrics, ReportDate, CampaignID) VALUES
    (401, 'Engagement Rate: 2.5%', '2023-12-10', 301),
    (402, 'Click-through Rate: 1.8%', '2024-03-15', 302),
    (403, 'Organic Reach: 5000', '2024-01-15', 303);

-- Insert data into Platform
INSERT INTO Platform (PlatformID, PlatformName, CampaignID) VALUES
    (501, 'Instagram', 301),
    (502, 'Facebook', 302),
    (503, 'Google', 303);

-- Insert data into SocialMediaPlatform
INSERT INTO SocialMediaPlatform (SocialPlatformID, PlatformName, PlatformType) VALUES
    (601, 'Instagram', 'Social Media'),
    (602, 'Facebook', 'Social Media'),
    (603, 'Twitter', 'Social Media'),
    (604, 'YouTube', 'Video Platform');

-- Insert data into InstagramService
INSERT INTO InstagramService (InstagramServiceID, SocialPlatformID) VALUES
    (701, 601);

-- Insert data into FacebookService
INSERT INTO FacebookService (FacebookServiceID, SocialPlatformID) VALUES
    (702, 602);

-- Insert data into TwitterService
INSERT INTO TwitterService (TwitterServiceID, SocialPlatformID) VALUES
    (703, 603);

-- Insert data into YouTubeService
INSERT INTO YouTubeService (YouTubeServiceID, SocialPlatformID) VALUES
    (704, 604);
-- Insert data into DigitalMarketingService table
INSERT INTO DigitalMarketingService (ServiceID, ServiceName, Description) VALUES
    (1, 'Social Media Management', 'Manage social media presence for brands'),
    (2, 'Content Marketing', 'Develop and distribute engaging content'),
    (3, 'SEO Optimization', 'Enhance search engine visibility');

-- Insert data into ServiceType table
INSERT INTO ServiceType (TypeID, TypeName, Description, ServiceID) VALUES
    (101, 'Instagram Engagement', 'Daily posts and stories', 1),
    (102, 'Facebook Ads', 'Run targeted ad campaigns', 1),
    (103, 'Twitter Trends', 'Engage with trending hashtags', 1),
    (104, 'YouTube Video Marketing', 'Create and promote video ads', 2);

-- Insert data into Client table
INSERT INTO Client (ClientID, ClientName, ContactInfo, ServiceID) VALUES
    (201, 'TechInnovate', 'contact@techinnovate.com', 1),
    (202, 'GreenSolutions', 'info@greensolutions.com', 2),
    (203, 'PetCarePlus', 'support@petcareplus.com', 3);

-- Insert data into Campaign table
INSERT INTO Campaign (CampaignID, CampaignName, Budget, StartDate, EndDate, ClientID, ServiceID) VALUES
    (301, 'Holiday Tech Sale', 20000, '2023-11-20', '2023-12-20', 201, 1),
    (302, 'Eco-Friendly Drive', 15000, '2024-02-01', '2024-03-01', 202, 2),
    (303, 'PetCare Awareness', 10000, '2023-10-01', '2023-12-31', 203, 3);

-- Insert data into Analytics table
INSERT INTO Analytics (AnalyticsID, Metrics, ReportDate, CampaignID) VALUES
    (401, 'Engagement Rate: 3.1%', '2023-12-10', 301),
    (402, 'Click-through Rate: 2.0%', '2024-02-15', 302),
    (403, 'Reach: 500,000 users', '2023-11-15', 303);

-- Insert data into Platform table
INSERT INTO Platform (PlatformID, PlatformName, CampaignID) VALUES
    (501, 'Instagram', 301),
    (502, 'Facebook', 302),
    (503, 'Twitter', 303);

-- Insert data into SocialMediaPlatform table
INSERT INTO SocialMediaPlatform (SocialPlatformID, PlatformName, PlatformType) VALUES
    (601, 'Instagram', 'Social Media'),
    (602, 'Facebook', 'Social Media'),
    (603, 'Twitter', 'Social Media'),
    (604, 'YouTube', 'Video Platform');

-- Insert data into InstagramService table
INSERT INTO InstagramService (InstagramServiceID, SocialPlatformID) VALUES
    (701, 601);

-- Insert data into FacebookService table
INSERT INTO FacebookService (FacebookServiceID, SocialPlatformID) VALUES
    (702, 602);

-- Insert data into TwitterService table
INSERT INTO TwitterService (TwitterServiceID, SocialPlatformID) VALUES
    (703, 603);

-- Insert data into YouTubeService table
INSERT INTO YouTubeService (YouTubeServiceID, SocialPlatformID) VALUES
    (704, 604);
SELECT * FROM DigitalMarketingService;
SELECT * FROM ServiceType;
SELECT * FROM Client;
SELECT * FROM Campaign;
SELECT * FROM Analytics;
SELECT * FROM Platform;
SELECT * FROM SocialMediaPlatform;
SELECT * FROM InstagramService;
SELECT * FROM FacebookService;
SELECT * FROM TwitterService;
SELECT * FROM YouTubeService;

INSERT INTO DigitalMarketingService (ServiceID, ServiceName, Description) VALUES
    (1, 'Social Media Management', 'Manage social media presence for brands'),
    (2, 'Content Marketing', 'Develop and distribute engaging content'),
    (3, 'SEO Optimization', 'Enhance search engine visibility'),
    (4, 'Email Marketing', 'Send newsletters and promotional emails'),
    (5, 'PPC Advertising', 'Pay-per-click advertising on search engines');

-- Insert data into ServiceType table
INSERT INTO ServiceType (TypeID, TypeName, Description, ServiceID) VALUES
    (101, 'Instagram Engagement', 'Daily posts, stories, and engagement', 1),
    (102, 'Facebook Ads', 'Run targeted ad campaigns on Facebook', 1),
    (103, 'Twitter Trends', 'Engage with trending hashtags and Twitter chats', 1),
    (104, 'YouTube Video Marketing', 'Create and promote video ads on YouTube', 2),
    (105, 'Email Campaigns', 'Design and manage email marketing campaigns', 4),
    (106, 'Search Ads', 'Targeted ads on search engine results pages', 5);

-- Insert data into Client table
INSERT INTO Client (ClientID, ClientName, ContactInfo, ServiceID) VALUES
    (201, 'TechInnovate', 'contact@techinnovate.com', 1),
    (202, 'GreenSolutions', 'info@greensolutions.com', 2),
    (203, 'PetCarePlus', 'support@petcareplus.com', 3),
    (204, 'TravelEuphoria', 'hello@traveleuphoria.com', 4),
    (205, 'FitLife', 'info@fitlife.com', 5);

-- Insert data into Campaign table
INSERT INTO Campaign (CampaignID, CampaignName, Budget, StartDate, EndDate, ClientID, ServiceID) VALUES
    (301, 'Holiday Tech Sale', 20000, '2023-11-20', '2023-12-20', 201, 1),
    (302, 'Eco-Friendly Drive', 15000, '2024-02-01', '2024-03-01', 202, 2),
    (303, 'PetCare Awareness', 10000, '2023-10-01', '2023-12-31', 203, 3),
    (304, 'Explore the World', 25000, '2024-01-10', '2024-02-10', 204, 4),
    (305, 'Fit for Life', 18000, '2024-03-05', '2024-04-05', 205, 5);

-- Insert data into Analytics table
INSERT INTO Analytics (AnalyticsID, Metrics, ReportDate, CampaignID) VALUES
    (401, 'Engagement Rate: 3.1%', '2023-12-10', 301),
    (402, 'Click-through Rate: 2.0%', '2024-02-15', 302),
    (403, 'Reach: 500,000 users', '2023-11-15', 303),
    (404, 'Open Rate: 25%', '2024-01-20', 304),
    (405, 'Conversion Rate: 10%', '2024-03-15', 305);

-- Insert data into Platform table
INSERT INTO Platform (PlatformID, PlatformName, CampaignID) VALUES
    (501, 'Instagram', 301),
    (502, 'Facebook', 302),
    (503, 'Twitter', 303),
    (504, 'YouTube', 304),
    (505, 'Email', 305);

-- Insert data into SocialMediaPlatform table
INSERT INTO SocialMediaPlatform (SocialPlatformID, PlatformName, PlatformType) VALUES
    (601, 'Instagram', 'Social Media'),
    (602, 'Facebook', 'Social Media'),
    (603, 'Twitter', 'Social Media'),
    (604, 'YouTube', 'Video Platform'),
    (605, 'LinkedIn', 'Professional Network');

-- Insert data into InstagramService table
INSERT INTO InstagramService (InstagramServiceID, SocialPlatformID) VALUES
    (701, 601);

-- Insert data into FacebookService table
INSERT INTO FacebookService (FacebookServiceID, SocialPlatformID) VALUES
    (702, 602);

-- Insert data into TwitterService table
INSERT INTO TwitterService (TwitterServiceID, SocialPlatformID) VALUES
    (703, 603);

-- Insert data into YouTubeService table
INSERT INTO YouTubeService (YouTubeServiceID, SocialPlatformID) VALUES
    (704, 604);

INSERT INTO DigitalMarketingService (ServiceID, ServiceName, Description) VALUES
    (4, 'Email Marketing', 'Targeted campaigns via email'),
    (5, 'Influencer Marketing', 'Partner with influencers to promote products');

-- Insert data into ServiceType
INSERT INTO ServiceType (TypeID, TypeName, Description, ServiceID) VALUES
    (105, 'Email Campaigns', 'Regular newsletters and promotions', 4),
    (106, 'Influencer Outreach', 'Engaging influencers for product promotion', 5);

-- Insert data into Client
INSERT INTO Client (ClientID, ClientName, ContactInfo, ServiceID) VALUES
    (204, 'FashionHub', 'contact@fashionhub.com', 4),
    (205, 'HomeGarden', 'info@homegarden.com', 5);

-- Insert data into Campaign
INSERT INTO Campaign (CampaignID, CampaignName, Budget, StartDate, EndDate, ClientID, ServiceID) VALUES
    (304, 'Winter Collection Launch', 25000, '2023-12-01', '2023-12-30', 204, 4),
    (305, 'Spring Influencer Campaign', 18000, '2024-04-01', '2024-05-01', 205, 5);

-- Insert data into Analytics
INSERT INTO Analytics (AnalyticsID, Metrics, ReportDate, CampaignID) VALUES
    (404, 'Open Rate: 25%', '2024-01-05', 304),
    (405, 'Influencer Engagement: 15%', '2024-05-10', 305);
    
SELECT * FROM DigitalMarketingService;

-- View all records in ServiceType
SELECT * FROM ServiceType;

-- View all records in Client
SELECT * FROM Client;

-- View all records in Campaign
SELECT * FROM Campaign;

-- View all records in Analytics
SELECT * FROM Analytics;
UPDATE DigitalMarketingService
SET Description = 'Manage and optimize email marketing campaigns'
WHERE ServiceID = 4;

-- Update a record in ServiceType
UPDATE ServiceType
SET Description = 'Monthly newsletters and special offers'
WHERE TypeID = 105;

-- Update a record in Client
UPDATE Client
SET ContactInfo = 'support@fashionhub.com'
WHERE ClientID = 204;

-- Update a record in Campaign
UPDATE Campaign
SET Budget = 30000
WHERE CampaignID = 304;

-- Update a record in Analytics
UPDATE Analytics
SET Metrics = 'Open Rate: 30%'
WHERE AnalyticsID = 404;

-- Delete a record from DigitalMarketingService
DELETE FROM DigitalMarketingService
WHERE ServiceID = 5;

-- Delete a record from ServiceType
DELETE FROM ServiceType
WHERE TypeID = 106;

-- Delete a record from Client
DELETE FROM Client
WHERE ClientID = 205;

-- Delete a record from Campaign
DELETE FROM Campaign
WHERE CampaignID = 305;

-- Delete a record from Analytics
DELETE FROM Analytics
WHERE AnalyticsID = 405;

SELECT * FROM DigitalMarketingService;

-- View all records in ServiceType
SELECT * FROM ServiceType;

-- View all records in Client
SELECT * FROM Client;

-- View all records in Campaign
SELECT * FROM Campaign;

-- View all records in Analytics
SELECT * FROM Analytics;