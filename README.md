<h1 align="center">alldrops-infra</h1>

*<p align="center">Terraform IaC to provision AWS infrastructure for a clone of alldrops.info website at aws.alldrops.info subdomain.</p>*

## About

The website alldrops.info is accessible on the following domain and subdomain:

1. https://alldrops.info - Hosted on Netlify

![](https://github.com/rossijonas/alldrops-infra/docs/001.png)

2. https://aws.alldrops.info - A clone, hosted on an AWS set of components, provisioned by the Terraform Infrastructure as Code contained in this repo.

![](https://github.com/rossijonas/alldrops-infra/docs/002.png)

The repository's main goals is playing with Terraform/AWS, and serving as example for others.

## Project Structure

This project assumes the following premises.

- Terraform uses Terraform Cloud as the Backend to maintain its state.

- An AWS S3 private bucket creation to host the website content, with no public access.

- AWS CloudFront used as CDN, fetching the website content at the private S3 bucket.

- Route53 serving as DNS for the subdomain aws.alldrops.info (alldrops.info is served by another service outside AWS).

- AWS Certificate Manager provides certificates and allow https.

- A CloudFront Function (JS) used to fetch `index.html` files for non-root URIs (for example.: https://alldrops.info/posts/linux-drops/ )


