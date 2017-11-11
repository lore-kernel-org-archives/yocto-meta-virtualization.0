Return-Path: <vlsireddy@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3D3BE00CF1; Fri, 10 Nov 2017 18:43:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (vlsireddy[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E53E00CEC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 18:43:43 -0800 (PST)
Received: by mail-wr0-f169.google.com with SMTP id q66so10037795wrb.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Nov 2017 18:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=UAVqDXh3JTOhFeLoBKXYLK9HSPCP7tldqAD/4X0n4As=;
	b=DNb4ovfZPHlp0b8dputajkdvefpyZN3h2SSBF6wHrijRYaYKuCAFInXoBusR4qVyz0
	MvNQzZGDDD4t/ADA4Ffz9ERQLd5lPvfbQjomAg1nA0QHAkoV/rUqAQIEU7HGOltb7Xfy
	3RVKYBV5x93kOsQd9jFii3Ko8PRwxjoyECdbrH+6sj6wxUBEKa2pUC7p/rmyme81m/sQ
	ecNge7R6LS35xYxN1Pak+VdlX2mG7pULc3QXoKdbz4DlGvEFP4WvylbUmJk7bGeRVUf9
	01HzMqnXs1JVgR/qUn92bM2X5Sfr5XK5jvpa2NLt5iruK2ZbFiFSPiCWz8EDuCd5manM
	AFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=UAVqDXh3JTOhFeLoBKXYLK9HSPCP7tldqAD/4X0n4As=;
	b=L4qbRkiaG3OM7p1RdQynQUlWst4Mp1m0idj+pxW0rEY3CmTFgsf5AtpktTlHclBBFR
	8W/qPlYp8Uk8lH0SYcx54UKhZE4Wnt4V3SPNnPUXlTjC6uRVOGp+Nyn3PYMeRm0R0Ulm
	J6n7T34iLdyMZEGkKwDkXUG+BamjYbjBBoOFgv7lEcsrj2BATMwLNcfxa8wRwUQnVHKc
	u9J+L8tMntYhr0tO0JnTC55Y9xHlS/l3p77PFGTPmYWJ8e4sbmL5lhjhCASBR+5lS09c
	IRx/izxb9KZIzR518eH9Mizox1bIPZZAUgwidaKaX7o4E8vFd263EeQvvE29vTPIsUS0
	dQFQ==
X-Gm-Message-State: AJaThX73CCh2eOVErNMuP/uWjPSIWXVggC8zRfPazuR8qmYujz1SbOGI
	vGTOftREv7iwEClHTvCvZzF3ECJnUsnu9x6N2qifkw==
X-Google-Smtp-Source: AGs4zMYfJbStKmxK0B3FORsbz4tK5jGku5GU2VWUNwRGGG/01HtOSTILZvxJJFcdjxg2+qAPw7vNfpVYKFFJeaStpYo=
X-Received: by 10.223.157.137 with SMTP id p9mr1936995wre.92.1510368222516;
	Fri, 10 Nov 2017 18:43:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.87.208 with HTTP; Fri, 10 Nov 2017 18:43:41 -0800 (PST)
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Fri, 10 Nov 2017 21:43:41 -0500
Message-ID: <CAGQ4JX0waag2sfdSmPSvFe609-V6s2HTEYgrG=Qz9OSio1SWMA@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Issue in irqbalance Code AARCH64-ARM-A53
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
X-List-Received-Date: Sat, 11 Nov 2017 02:43:44 -0000
Content-Type: multipart/alternative; boundary="f403043a2794621e79055dac0199"

--f403043a2794621e79055dac0199
Content-Type: text/plain; charset="UTF-8"

Hi All,

1. based on this link

http://layers.openembedded.org/layerindex/branch/master/layer/meta-virtualization/

2. i see the irqbalance is of version 1.1.0 [Dec 4, 2015]

3. Building meta-virtualization library for irqbalance failed for AARHC64.

4. The Issue is simple bug [i fixed in my downloaded, untar'ed code],looks
someone also fixed the code and new version 1.2.0 does include this fix.

[
https://github.com/Irqbalance/irqbalance/commit/1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e551
]

5. Is there any reason why irqbalance is NOT updated to 1.2.0 in
meta-virtualization.

6. According to github, version 1.2.0 has Aarch64 support [
https://github.com/Irqbalance/irqbalance/releases]

Thanks
RC Reddy

--f403043a2794621e79055dac0199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div>=
<div>1. based on this link</div><div><br></div><div><a href=3D"http://layer=
s.openembedded.org/layerindex/branch/master/layer/meta-virtualization/">htt=
p://layers.openembedded.org/layerindex/branch/master/layer/meta-virtualizat=
ion/</a><br></div><div><br></div><div>2. i see the irqbalance is of version=
 1.1.0 [Dec 4, 2015]</div><div><br></div><div>3. Building meta-virtualizati=
on library for irqbalance failed for AARHC64.</div><div><br></div><div>4. T=
he Issue is simple bug [i fixed in my downloaded, untar&#39;ed code],looks =
someone also fixed the code and new version 1.2.0 does include this fix.</d=
iv><div><br></div><div>[<a href=3D"https://github.com/Irqbalance/irqbalance=
/commit/1dccd034a90b2f0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c=
26a4604e551">https://github.com/Irqbalance/irqbalance/commit/1dccd034a90b2f=
0221423632de65cbf84d05ebfb#diff-69b8dbcfbbf11746aa38c26a4604e551</a>]</div>=
<div><br></div><div>5. Is there any reason why irqbalance is NOT updated to=
 1.2.0 in meta-virtualization.</div><div><br></div><div>6. According to git=
hub, version 1.2.0 has Aarch64 support [<a href=3D"https://github.com/Irqba=
lance/irqbalance/releases">https://github.com/Irqbalance/irqbalance/release=
s</a>]</div><div><br></div><div>Thanks</div><div>RC Reddy</div></div>

--f403043a2794621e79055dac0199--
