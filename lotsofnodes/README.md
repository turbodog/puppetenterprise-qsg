This script automates creation of up to 5000 puppet nodes

###Instructions
- Before generating nodes, in the UI add a rule to the "PE MCollective" group where "id is root". This will keep your non-root agents from puppet run failures since the mcollective class has to be applied with puppet running as a privileged user
- `vagrant ssh` into your master or agent node
  - If you're logged into your agent node, `./installagent.sh` first
  - `./mknodes.sh` (which will submit the CSR)
  - Let this run...
- In another terminal or the web UI, periodically sign all outstanding certs. Do this either by (1) running on the master `puppet cert sign --all` or (2) accept all in the UI 
- In another terminal: 
  - `vagrant ssh` into the same VM running the script
  - `sudo su`
  - `su - nonroot`
  - `./mknodes.sh` (which will cause a puppet run on nodes already signed so that the node's facts are submitted)


