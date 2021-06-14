Subject: Networking issue with l3s when using systemd
To: meta-virtualization@lists.yoctoproject.org
From: "Matt Spencer" <matt.spencer@arm.com>
X-Originating-Location: GB (80.229.1.75)
X-Originating-Platform: Windows Chrome 91
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 03:27:19 -0700
Message-ID: <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="cTtemlVZTamJBXuaW14L"

--cTtemlVZTamJBXuaW14L
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all

There seems to be a networking problem with k3s when using systemd.=C2=A0 =
The problem manifests in that none of the kube-system management containers=
 are able to communicate with eachother.

The root cause seems to be that systemd-networking is actively managing ve=
th interfaces created by k3s/flannel.=C2=A0 This happens because of '/lib/s=
ystemd/network/80-wired.network' added by the systemd recipe, which is matc=
hing on Type=3Dether.

My fix is to modify the 80-wired.network to add 'Name=3Deth*'.=C2=A0 With =
this in place, k3s works as expected.

I am not sure what the correct upstream solution should be for Yocto?=C2=
=A0 Your help would be appreciated.

/Matt

--cTtemlVZTamJBXuaW14L
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all<br /><br />There seems to be a networking problem with k3s when usin=
g systemd.&nbsp; The problem manifests in that none of the kube-system mana=
gement containers are able to communicate with eachother.<br /><br />The ro=
ot cause seems to be that systemd-networking is actively managing veth inte=
rfaces created by k3s/flannel.&nbsp; This happens because of '/lib/systemd/=
network/80-wired.network' added by the systemd recipe, which is matching on=
 Type=3Dether.<br /><br />My fix is to modify the 80-wired.network to add '=
Name=3Deth*'.&nbsp; With this in place, k3s works as expected.<br /><br />I=
 am not sure what the correct upstream solution should be for Yocto?&nbsp; =
Your help would be appreciated.<br /><br />/Matt

--cTtemlVZTamJBXuaW14L--
