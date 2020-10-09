# Launch VM in GCP for SS

1. Create your own project from [GCP console](https://console.cloud.google.com/)
2. Create service account in this project, then download the keyfile json 
3. Run terraform locally
    ```bash
    $ export GOOGLE_CLOUD_KEYFILE_JSON=/home/jsnow/gcp.json
    $ terraform init
    $ terraform plan -var 'ss_password=your_ss_password' -var 'project_id=your_project_id' 
    $ terraform apply -var 'ss_password=your_ss_password' -var 'project_id=your_project_id' 
    ```
4. you will get the result like 
    ```bash
    ...

    Do you want to perform these actions?
      Terraform will perform the actions described above.
      Only 'yes' will be accepted to approve.
    
      Enter a value: yes
    
    ......
    
    Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
    
    Outputs:
    
    ss_encrypt_method = aes-256-cfb
    ss_server_ip = 34.96.217.145
    ss_server_port = 443
    ```
5. Config your client 

### Note
> The default region is Hong Kong
> For Google Cloud Platform and Terraform learning purpose only, please delete in 24 hours after download.

