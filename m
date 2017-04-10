Return-Path: <Muhammad_Sheheryar@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00E8AE009AA; Mon, 10 Apr 2017 02:51:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B6C3E00546
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Apr 2017 02:51:09 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cxVyW-000053-N5 from Muhammad_Sheheryar@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Mon, 10 Apr 2017 02:51:09 -0700
Received: from SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) by
	SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Mon, 10 Apr 2017 10:51:05 +0100
Received: from SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f]) by
	SVR-IES-MBX-04.mgc.mentorg.com ([fe80::9dd6:2f1c:ad6:d35f%22]) with
	mapi id 15.00.1210.000; Mon, 10 Apr 2017 10:51:05 +0100
From: "Sheheryar, Muhammad" <Muhammad_Sheheryar@mentor.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Thread-Topic: Errors in building docker
Thread-Index: AQHSsd+l9g3VElpJGUqaKT/9Ruj6zw==
Date: Mon, 10 Apr 2017 09:51:05 +0000
Message-ID: <1491817865525.65707@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Errors in building docker
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Apr 2017 09:51:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_149181786552565707mentorcom_"

--_000_149181786552565707mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


I am trying to build docker in my yocto project (fido branch). I am encount=
ering the following errors


Log data follows:
| DEBUG: Executing shell function do_compile
| /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnue=
abi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git
| # WARNING! I don't seem to be running in the Docker container.
| # The result of this command might be an incorrect build, and will not be
| #   officially supported.
| #
| # Try this instead: make all
| #
|
| bundles/1.5.0-dev already exists. Removing.
|
| ---> Making bundle: dynbinary (in bundles/1.5.0-dev/dynbinary)
| Created binary: /var/mshehery/Release_7.3/duplicate_project_containers/sh=
eheryar_containers/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-ne=
on-oe-linux-gnueabi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36d=
c-r0/git/bundles/1.5.0-dev/dynbinary/dockerinit-1.5.0-dev
| # code.google.com/p/gosqlite/sqlite3
| /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_containe=
rs/yocto/fido/build/mf0200/tmp-glibc/sysroots/x86_64-linux/usr/lib/libsqlit=
e3.so: file not recognized: File format not recognized
| collect2: error: ld returned 1 exit status
| WARNING: /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar=
_containers/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-l=
inux-gnueabi/docker/1.5.0+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/te=
mp/run.do_compile.32468:1 exit 1 from
|   DOCKER_GITCOMMIT=3D"2243e32cbbf1c9809c262a7376d34ca43a7a36dc" ./hack/ma=
ke.sh dynbinary
| ERROR: Function failed: do_compile (log file is located at /var/mshehery/=
Release_7.3/duplicate_project_containers/sheheryar_containers/yocto/fido/bu=
ild/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnueabi/docker/1.5.0=
+git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/log.do_compile.32468)


My instinct is that the errors are somehow related to go-sqlite package req=
uired for docker. The fetcher for the package fails as its previous reposit=
ory has been shifted or removed. Can someone help me out?


Regards,


Muhammad Sheheryar







--_000_149181786552565707mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi,</p>
<p><br>
</p>
<p>I am trying to build docker in my yocto project (fido branch). I am enco=
untering the following errors</p>
<p><br>
</p>
<p><span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-f=
amily: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-se=
rif;">Log data follows:</span></span></span><br style=3D"font-family: Helve=
tica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| DEBUG: Executing shell function do_compile</span></span></span><br sty=
le=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_conta=
iners/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-g=
nueabi/docker/1.5.0&#43;git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/git<=
/span></span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| # WARNING! I don't seem to be running in the Docker container.</span><=
/span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| # The result of this command might be an incorrect build, and will not=
 be</span></span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| #&nbsp;&nbsp; officially supported.</span></span></span><br style=3D"f=
ont-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| #</span></span></span><br style=3D"font-family: Helvetica,sans-serif;"=
>
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| # Try this instead: make all</span></span></span><br style=3D"font-fam=
ily: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| #</span></span></span><br style=3D"font-family: Helvetica,sans-serif;"=
>
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">|
</span></span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| bundles/1.5.0-dev already exists. Removing.</span></span></span><br st=
yle=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">|
</span></span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| ---&gt; Making bundle: dynbinary (in bundles/1.5.0-dev/dynbinary)</spa=
n></span></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| Created binary: /var/mshehery/Release_7.3/duplicate_project_containers=
/sheheryar_containers/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp=
-neon-oe-linux-gnueabi/docker/1.5.0&#43;git2243e32cbbf1c9809c262a7376d34ca4=
3a7a36dc-r0/git/bundles/1.5.0-dev/dynbinary/dockerinit-1.5.0-dev</span></sp=
an></span><br style=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| # code.google.com/p/gosqlite/sqlite3</span></span></span><br style=3D"=
font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| /var/mshehery/Release_7.3/duplicate_project_containers/sheheryar_conta=
iners/yocto/fido/build/mf0200/tmp-glibc/sysroots/x86_64-linux/usr/lib/libsq=
lite3.so:
 file not recognized: File format not recognized</span></span></span><br st=
yle=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| collect2: error: ld returned 1 exit status</span></span></span><br sty=
le=3D"font-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| WARNING: /var/mshehery/Release_7.3/duplicate_project_containers/sheher=
yar_containers/yocto/fido/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-o=
e-linux-gnueabi/docker/1.5.0&#43;git2243e32cbbf1c9809c262a7376d34ca43a7a36d=
c-r0/temp/run.do_compile.32468:1
 exit 1 from</span></span></span><br style=3D"font-family: Helvetica,sans-s=
erif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">|&nbsp;&nbsp; DOCKER_GITCOMMIT=3D&quot;2243e32cbbf1c9809c262a7376d34ca43=
a7a36dc&quot; ./hack/make.sh dynbinary</span></span></span><br style=3D"fon=
t-family: Helvetica,sans-serif;">
<span style=3D"font-family: Helvetica,sans-serif;"><span style=3D"font-fami=
ly: Helvetica,sans-serif;"><span style=3D"font-family: Helvetica,sans-serif=
;">| ERROR: Function failed: do_compile (log file is located at /var/mshehe=
ry/Release_7.3/duplicate_project_containers/sheheryar_containers/yocto/fido=
/build/mf0200/tmp-glibc/work/cortexa9hf-vfp-neon-oe-linux-gnueabi/docker/1.=
5.0&#43;git2243e32cbbf1c9809c262a7376d34ca43a7a36dc-r0/temp/log.do_compile.=
32468)</span></span></span></p>
<p><br>
</p>
<p>My instinct is that the errors are somehow related to go-sqlite package&=
nbsp;required for docker. The fetcher for the package fails as its previous=
 repository has been shifted or removed. Can someone&nbsp;help me out?</p>
<p><br>
</p>
<p>Regards,</p>
<p><br>
</p>
<p>Muhammad Sheheryar <br>
</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
<p><br>
</p>
</body>
</html>

--_000_149181786552565707mentorcom_--
