
### How to run a Xubuntu Desktop  ?

Pull from Docker Index and run the image

```
CID=$(docker run -p 2222:22 -t -d tikia/xubuntu-x2go-jd)
docker logs $CID

note down the root/dockerx passwords.
```

Port Exposed : 22

Volumes : /home/dockerx/Downloads

For now, you have to run /home/dockerx/JD2Setup_x64.sh

Config to make in JD :
- User Interface -> Enable Silent Mode
- Bubble Notify -> Show bubbles if Never
- Tray Icon -> Décocher Enabled


### How to run/connect to server with a Client?

Download the x2go client for your OS from:
http://wiki.x2go.org/doku.php/doc:installation:x2goclient

Create a new session and connect to your seerver
Host : (Your Server IP) Port : 2222 Username : dockerx Password : (get it from the Docker logs above)

Select the Session TYPE as : XFCE 

You can also SSH to the docker container directly with root or dockerx users and their passwords over the port 2222 with linux ssh or windows putty client.
