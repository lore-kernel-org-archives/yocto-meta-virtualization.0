Return-Path: <supritisingh08@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F9F8E00C6E; Tue,  9 Feb 2016 01:22:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (supritisingh08[at]gmail.com)
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.46 listed in list.dnswl.org]
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA673E00C59
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Feb 2016 01:22:26 -0800 (PST)
Received: by mail-lf0-f46.google.com with SMTP id m1so113080447lfg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Feb 2016 01:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=qxwF/1S8DZey5him9m3sbvsFlK7SReh7WtmcCUGTDF0=;
	b=i9TQSDyAicSveaqwBIkvZ0NxJPi0pz0wbE23cgm+NZCdk2yHdruXlqnhAHekEUzy43
	BfOFMJAigxETDO6+Hy+/iPbdvDAoSMpSJjtbNSQSjOK4Foe8mRm3ATeopEIc5G3acO3d
	XbktwnfC/N0sO+Rnqb6UVBtWaPHwXQjz95QLEZQiRoGc+GqQg9vF2e6r4wK4GHluo49G
	1Mh6Y8Hr9iX8MKV2mx3ANsBM7P0cCkvOCn6xAJ6kfaJhkkr/F0dTRYPjXgLGRFK6exyr
	tYAd71cO7uLdFB38LgD3OD+Nt16J6qmtB9QcD0NxydS+3XqMsBNVOyBDyyfxGQJAUGx8
	GMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=qxwF/1S8DZey5him9m3sbvsFlK7SReh7WtmcCUGTDF0=;
	b=UjSSqO6xK+1i2AnZ78GAJU1Qjh+5wSaVYENDVhM8OIPw0h052HUDY0BtexjgOKmVPY
	9/mg1noMrQqOoBYffCQy1mkIGzQrGjNJxQQEGf/iX9MQTVPyhJLzyUshUFkpjzqmnpaF
	qNbgNsbgWmVR61pU3r3Jz+SEW/YU1h8UgaQCkL3vd/h10gaxWLT2LuDA8YFS5bCwc0Wc
	HpqDieSl7QHoG6wc40bzrvUz3A30FHVyq+I/hVGYcV2RWhG5PxbspsItEqblOy8fPDNB
	9VdQi+MN9CxMl7tJywbH5lerCE/I11x8Ba+j5Fm4Vqas/jt2xSHuz0/sqMsguIaLLkR6
	1Dcw==
X-Gm-Message-State: AG10YOT10dvF+G6IptzgcYBamhBJYz6dA9yA05e0CqRFKbip3a9MRDApga0kRFUfR1knnN6uKExj0ORSm1PiOA==
MIME-Version: 1.0
X-Received: by 10.25.24.82 with SMTP id o79mr13576702lfi.144.1455009745079;
	Tue, 09 Feb 2016 01:22:25 -0800 (PST)
Received: by 10.114.78.195 with HTTP; Tue, 9 Feb 2016 01:22:25 -0800 (PST)
Date: Tue, 9 Feb 2016 10:22:25 +0100
Message-ID: <CAO1oV+fmmzZ4XdV2BkgqH+Xoy-jdMRZ1msEfGaAOe-jOtQEjPg@mail.gmail.com>
From: Supriti Singh <supritisingh08@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Getting virtualization running on mbmax yocto
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
X-List-Received-Date: Tue, 09 Feb 2016 09:22:30 -0000
Content-Type: multipart/alternative; boundary=001a114058360018e5052b52db5e

--001a114058360018e5052b52db5e
Content-Type: text/plain; charset=UTF-8

Hello,

I have a Minnowboard Max.
I followed the instructions http://wiki.minnowboard.org/Yocto_Project from
here to get a yocto kernel running on the board.

I want to enable virtualization with kvm.

My source hierarchy is :
$HOME/source/poky/"all the layers".

To add the meta-virtualization layer, I added the following into the
bblayers.conf
BBLAYERS += "/local/source/poky/meta-openembedded/meta-networking"
BBLAYERS += "/local/source/poky/meta-openembedded/meta-python"
BBLAYERS += "/local/source/poky/meta-openembedded/meta-oe"
BBLAYERS += "/local/source/poky/meta-openembedded/meta-filesystems"
BBLAYERS += "/local/source/poky/meta-virtualization"


When I do a build, I get the following errror:
ERROR: ParseError at
/local/source/poky/meta-virtualization/recipes-extended/images/
cloud-image-controller.bb:29: Could not inherit file
classes/image-vm.bbclass

Is there something else that I need to do?


Thanks,
Supriti

--001a114058360018e5052b52db5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have a Minnowboard Max.=C2=A0<=
/div><div>I followed the instructions=C2=A0<a href=3D"http://wiki.minnowboa=
rd.org/Yocto_Project">http://wiki.minnowboard.org/Yocto_Project</a> from he=
re to get a yocto kernel running on the board.</div><div><br></div><div>I w=
ant to enable virtualization with kvm.</div><div><br></div><div>My source h=
ierarchy is :</div><div>$HOME/source/poky/&quot;all the layers&quot;.</div>=
<div><br></div><div>To add the meta-virtualization layer, I added the follo=
wing into the bblayers.conf</div><div><div>BBLAYERS +=3D &quot;/local/sourc=
e/poky/meta-openembedded/meta-networking&quot;</div><div>BBLAYERS +=3D &quo=
t;/local/source/poky/meta-openembedded/meta-python&quot;</div><div>BBLAYERS=
 +=3D &quot;/local/source/poky/meta-openembedded/meta-oe&quot;</div><div>BB=
LAYERS +=3D &quot;/local/source/poky/meta-openembedded/meta-filesystems&quo=
t;</div><div>BBLAYERS +=3D &quot;/local/source/poky/meta-virtualization&quo=
t;</div></div><div><br></div><div><br></div><div>When I do a build, I get t=
he following errror:</div><div>ERROR: ParseError at /local/source/poky/meta=
-virtualization/recipes-extended/images/<a href=3D"http://cloud-image-contr=
oller.bb:29">cloud-image-controller.bb:29</a>: Could not inherit file class=
es/image-vm.bbclass=C2=A0<br></div><div><br></div><div>Is there something e=
lse that I need to do?=C2=A0</div><div><br></div><div><br></div><div>Thanks=
,</div><div>Supriti=C2=A0</div></div>

--001a114058360018e5052b52db5e--
