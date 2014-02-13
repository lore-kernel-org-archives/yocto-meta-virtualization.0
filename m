Return-Path: <v_gota@yahoo.com>
Received: from nm16.bullet.mail.bf1.yahoo.com (nm16.bullet.mail.bf1.yahoo.com
	[98.139.212.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6045E007DF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Feb 2014 03:17:51 -0800 (PST)
Received: from [98.139.214.32] by nm16.bullet.mail.bf1.yahoo.com with NNFMP;
	13 Feb 2014 11:17:50 -0000
Received: from [98.139.212.231] by tm15.bullet.mail.bf1.yahoo.com with NNFMP;
	13 Feb 2014 11:17:50 -0000
Received: from [127.0.0.1] by omp1040.mail.bf1.yahoo.com with NNFMP;
	13 Feb 2014 11:17:50 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 342568.69516.bm@omp1040.mail.bf1.yahoo.com
Received: (qmail 42614 invoked by uid 60001); 13 Feb 2014 11:17:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1392290269; bh=bypRpSGL1Vw7EOub+8mhSUxkuSpQBG/TO+HpMcRfXcg=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=x9E/6rOY/UwY1ZggxK8GKQtPzsGlYB/Qg0sKoKAtYiWkajjgWjIQCUSllms6jRS5FX3MdFMR11YZe48r5OQGCNNfLirXGwYrj+hSdHvhDp8r+3TZjyq81rIpvyx9lcfhBo8ySV/8zo/d1Eu/OP0+i8ocJtewFmejdOZVxVBMVKs=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=sn4VgGuXhBFOf7Ceh3NTwmvx2D6I+0eAipe+JzaR7f33QVTRvRReBbiIk4yRkMpsQqkgGrQW8JzCxbfBLlzbllQ5uTUaac8ivmGebRjIZ1Zd+LmGJsQboNF6oXagEplhKDK700VHyGqqxKsQy53yfUmz8s6dNu71cWg75W5b1og=;
X-YMail-OSG: 1jFAmEEVM1k4V6GWLb5DOZb6sDl2wu2n58ImqiFzbuxVzt9
	5Ym696dfHxxBNnVatuq8HhZJCdzYsNCdFXQbWsY.dRzOvVBZtLeSRYt6keyQ
	GlScTUqLCmZ1pss8QfB2qYNx017Jhg8_Tt6rfYEaUSwvIHlxkEYEvsXr0PNA
	53QJWzOD241B1tT3onD5syBy3Ids570Gbty.cmePqmy8oEH9GEXE37UuloRa
	amfv4iDJVQ8cIg21RpYrokG3S6_IPImi2s.j6L_IVB9pca4v0YUAPj4Lys8H
	hylDM9CQPIcbnTBvvNLFphj0r_pFu.seoaKRzPr6VOM5DHHBnQPfFOENmUeV
	MjPfZtBOR.dOdAjV5sZqTLid8KgAleKv_h2ipPvamdrmZ3CJtmWH5Yb4HDBK
	RLJQrAhHgG7b94gWcPRH4FXCL8Kcc7qIkcnzFRqBML1m2dHiIqFRu0_gLL_0
	vI3cTVD0F2xpy_mmLVl8ks8VnANdJf7vkv5DSbpimwOjMf5im2.itw_pS5Bu
	f71fCAWQOWLZDDKZ5TrXzBCtZcdmaQoB68fbKgGTM54f7LvRDQiR4ASDYNSm
	iA.R_wWsq8C4tCN.qdr.C9w--
Received: from [116.197.184.14] by web162001.mail.bf1.yahoo.com via HTTP;
	Thu, 13 Feb 2014 03:17:49 PST
X-Rocket-MIMEInfo: 002.001,
	CgpJIHB1bGxlZCBkeWxhbiBtZXRhLXZpcnR1YWxpemF0aW9uIGxheWVyIGludG8gbXkgeW9jdG8gcHJvamVjdCBiYXNlZCBvZmYgZHlsYW4uIEkgYW0gdW5hYmxlIHRvIGJ1aWxkIGNvcmUtaW1hZ2UtKiB3aXRoIG1ldGEtdmlydHVhbGl6YXRpb24gaW5jbHVkZWQuIEl0IGZhaWxzIHRvd2FyZHMgdGhlIGVuZCB3aXRoIHRoaXMgZXJyb3IuCgp8IMKgIDQ5Okluc3RhbGxpbmcgbGlieGVuc3RvcmUzLjAgwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIFsgwqAzJV0KfCBPdXRwdXQgZnIBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.177.636
Message-ID: <1392290269.37071.YahooMailNeo@web162001.mail.bf1.yahoo.com>
Date: Thu, 13 Feb 2014 03:17:49 -0800 (PST)
From: Venkatesh Gota <v_gota@yahoo.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
MIME-Version: 1.0
Subject: Build error: do_rootfs: libxenstore3.0-4.1.2-r1.0@x86_64
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: Venkatesh Gota <v_gota@yahoo.com>
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Feb 2014 11:17:52 -0000
Content-Type: multipart/alternative;
	boundary="1969517296-1678738528-1392290269=:37071"

--1969517296-1678738528-1392290269=:37071
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=0A=0AI pulled dylan meta-virtualization layer into my yocto project based =
off dylan. I am unable to build core-image-* with meta-virtualization inclu=
ded. It fails towards the end with this error.=0A=0A| =A0 49:Installing lib=
xenstore3.0 =A0######################################## [ =A03%]=0A| Output=
 from libxenstore3.0-4.1.2-r1.0@x86_64:=0A| error: unpacking of archive fai=
led on file /usr/lib64: cpio: rename failed - Resource temporarily unavaila=
ble=0A| =A0 50:Installing eglibc-gconv-.. #################################=
####### [ =A03%]=0A=0Athe file exists, and not sure what is cpio complainin=
g about.=0A=0Ayocto-build:/mnt/vgota/poky/build/tmp-eglibc/work/x86_64-poky=
-linux$ find . | grep libxenstore3.0 | xargs ls -al=0A-rw-r--r-- 2 vgota vg=
ota =A00 Feb 13 16:32 ./xen/4.1.2-r1/deploy-rpms/x86_64/libxenstore3.0-4.1.=
2-r1.0.x86_64.rpm=0Alrwxrwxrwx 1 vgota vgota 22 Feb 13 15:29 ./xen/4.1.2-r1=
/pkgdata/runtime-reverse/libxenstore3.0 -> ../runtime/libxenstore=0A=0Aany =
insight is appreciated.=0A

--1969517296-1678738528-1392290269=:37071
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:He=
lveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;fo=
nt-size:12pt"><div><br></div><div style=3D"color: rgb(0, 0, 0); font-size: =
16px; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Luci=
da Grande', sans-serif; background-color: transparent; font-style: normal;"=
>I pulled dylan meta-virtualization layer into my yocto project based off d=
ylan. I am unable to build core-image-* with meta-virtualization included. =
It fails towards the end with this error.</div><div style=3D"color: rgb(0, =
0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helve=
tica, Arial, 'Lucida Grande', sans-serif; background-color: transparent; fo=
nt-style: normal;"><br></div><div style=3D"background-color: transparent;">=
| &nbsp; 49:Installing libxenstore3.0 &nbsp;###############################=
######### [ &nbsp;3%]</div><div style=3D"background-color: transparent;">|
 Output from libxenstore3.0-4.1.2-r1.0@x86_64:</div><div style=3D"backgroun=
d-color: transparent;">| error: unpacking of archive failed on file /usr/li=
b64: cpio: rename failed - Resource temporarily unavailable</div><div style=
=3D"background-color: transparent;">| &nbsp; 50:Installing eglibc-gconv-.. =
######################################## [ &nbsp;3%]</div><div><br></div><d=
iv>the file exists, and not sure what is cpio complaining about.</div><div>=
<br></div><div><div><div>yocto-build:/mnt/vgota/poky/build/tmp-eglibc/work/=
x86_64-poky-linux$ find . | grep libxenstore3.0 | xargs ls -al</div><div>-r=
w-r--r-- 2 vgota vgota &nbsp;0 Feb 13 16:32 ./xen/4.1.2-r1/deploy-rpms/x86_=
64/libxenstore3.0-4.1.2-r1.0.x86_64.rpm</div><div>lrwxrwxrwx 1 vgota vgota =
22 Feb 13 15:29 ./xen/4.1.2-r1/pkgdata/runtime-reverse/libxenstore3.0 -&gt;=
 ../runtime/libxenstore</div><div><br></div><div>any insight is appreciated=
.</div></div><div><br></div></div></div></body></html>

--1969517296-1678738528-1392290269=:37071--
