Subject: Re: thoughts on k3s and supporting builds of more than one k8s version
To: meta-virtualization@lists.yoctoproject.org
From: "Mark Abrams" <mark.abrams@suse.com>
X-Originating-Location: Albany, New York, US (74.76.75.190)
X-Originating-Platform: Mac Chrome 92
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 10 Sep 2021 07:06:11 -0700
References: <CADkTA4PVaJRsbzw8E8cco8_F8u-g2J6v9S9eUqygTK+=8C70Tg@mail.gmail.com>
In-Reply-To: <CADkTA4PVaJRsbzw8E8cco8_F8u-g2J6v9S9eUqygTK+=8C70Tg@mail.gmail.com>
Message-ID: <21854.1631282771938106113@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="A6xRmVfcreo4nQUdRpVe"

--A6xRmVfcreo4nQUdRpVe
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Bruce this sounds reasonable from a packaging standpoint and also presents =
an interesting challenge - and one that seems to be broader than just yocto=
 projects. It is a challenge we are seeing for edge deployments of k8s ever=
ywhere. Embedded systems are traditionally shipped with longer update/upgra=
de lifecycles than cloud native software. A typical embedded lifecycle seem=
s to be anywhere from 2-5 years minimum. Kubernetes on the other hand ships=
 new releases about 3x / year.

As we move toward projects that include cloud native technology at the edge=
, I think we will need to resolve for a more rapid software lifecycle.

One solution I know of when using k3s is the system-upgrade-controller. Thi=
s can upgrade the k3s binary according to a configured plan. It is also pos=
sible to use the same controller to update any arbitrary binary in the syst=
em - assuming, of course that these are not residing on the immutable part =
of the file system. Also, the system-upgrade-controller works with any kube=
rnetes not just k3s.

--A6xRmVfcreo4nQUdRpVe
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Bruce this sounds reasonable from a packaging standpoint and also presents =
an interesting challenge - and one that seems to be broader than just yocto=
 projects. It is a challenge we are seeing for edge deployments of k8s ever=
ywhere. Embedded systems are traditionally shipped with longer update/upgra=
de lifecycles than cloud native software. A typical embedded lifecycle seem=
s to be anywhere from 2-5 years minimum. Kubernetes on the other hand ships=
 new releases about 3x / year.&nbsp;<br /><br />As we move toward projects =
that include cloud native technology at the edge, I think we will need to r=
esolve for a more rapid software lifecycle.<br /><br />One solution I know =
of when using k3s is the system-upgrade-controller. This can upgrade the k3=
s binary according to a configured plan. It is also possible to use the sam=
e controller to update any arbitrary binary in the system - assuming, of co=
urse that these are not residing on the immutable part of the file system. =
Also, the system-upgrade-controller works with any kubernetes not just k3s.=
<br />

--A6xRmVfcreo4nQUdRpVe--
