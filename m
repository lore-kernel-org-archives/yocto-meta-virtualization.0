Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4475EE00961; Tue, 14 Mar 2017 01:40:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.43 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.43 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85813E00939
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 01:40:43 -0700 (PDT)
Received: by mail-oi0-f43.google.com with SMTP id 2so88908597oif.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Mar 2017 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=CjcyQ2Uyw5H9zSoPcl+Xbme7IOImSnMt5grJei17m1I=;
	b=OoSZMyyUtxfQ19E9q6dK9+1p28tz43hLQnvmPBVzoLpkW0k6NesN80iSwrlaIhlnEu
	tAt9PrRqe98EgO8WfLl7QYgL+JXDdGGRV8K9tj+kOoNAVc60uPFaF3ys8z0VQSZ+BPiP
	vG30+QLWpKqEWnFghWbPrNV+PTT3MnAvVPaD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CjcyQ2Uyw5H9zSoPcl+Xbme7IOImSnMt5grJei17m1I=;
	b=XO9XF+OlX6WUbIRBUUaAIPXYyglqP3kiq+pGM2sd4//2DWXRGQvgzi1CTT7pgCVz1a
	BrITJwvHUqZIUFSwKAuQus1gyCTLWyh/YzLB0gT6PSnXgj+OLn1BblaHAG+y/Enovj8Y
	Kle+0lQAESwalBXmzynpft5nG0qZca+pdmqIknBG6GeyJ6rndJKq+nKPNRCOV26geWBw
	bfw9/6kgYgrdsL1yQ9/1dQyWZQ6Tp5uQyDPYVqZ//RpcJnYXj/k4bTORWzjKtEblJZfz
	WsuklD7IjeY0JU+UrnmYU6Alh8yF5ORDjhB+N9mdgGulan6P09yR6D3icfqvl7bzm6FK
	GUsw==
X-Gm-Message-State: AMke39ncD2LEQvtD+J8U89seVeGh/3TnwrnUZOGlC/nqIIA2rR/wHEaR0MCZnuM+io7XUY3s+Q+uzyVySWvr0r9k
X-Received: by 10.202.215.214 with SMTP id o205mr17470421oig.145.1489480842739;
	Tue, 14 Mar 2017 01:40:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.52 with HTTP; Tue, 14 Mar 2017 01:40:42 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 14 Mar 2017 09:40:42 +0100
Message-ID: <CAFL6qn6cqYD3RFpd6z5exD4GvxbNEL92X_eF-0OCf3APSMz4CA@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org, 
	meta-virtualization@yoctoproject.org
Subject: xen-image-minimal execution error
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
X-List-Received-Date: Tue, 14 Mar 2017 08:40:53 -0000
Content-Type: multipart/alternative; boundary=001a113cd3f8881334054aacc875

--001a113cd3f8881334054aacc875
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm using Yocto master branch and I'm not able to compile a xen minimal
image. I have experimented different errors, the last one is the next one:

pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbake
xen-image-minimal
Loading cache: 100%
|####################################################################################|
Time: 0:00:01
Loaded 2751 entries from dependency cache.
Parsing recipes: 100%
|##################################################################################|
Time: 0:00:01
Parsing of 1986 .bb files complete (1985 cached, 1 parsed). 2752 targets,
208 skipped, 0 masked, 0 errors.
ERROR: No recipes available for:

/opt/yocto_GE/yocto_master_v2/poky/meta-selinux/recipes-extended/findutils/findutils_4.2.31.bbappend

Summary: There was 1 ERROR message shown, returning a non-zero exit code.
pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$

Before experimenting this error, I have got another one related to the gcc
compiler version. I have git pull my project and now the error that I got
is the one that I have reported. Anyway, I think that the compilation error
must be solved too, but I don't know how.

Some of you have told me to switch the Yocto branch to a stable one, but
the reason for what I need to use this one, is that after I need to launch
the compiled image in Xilinx QEMU, which I have understood that it's not
supported by other branches as could be Morty.

Do you have any other possible solutions?
Can any one help me with this?
Best regards,
Pello

--001a113cd3f8881334054aacc875
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m using Yocto master bran=
ch and I&#39;m not able to compile a xen minimal image. I have experimented=
 different errors, the last one is the next one:</div><div><br></div><div><=
div>pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbak=
e xen-image-minimal</div><div>Loading cache: 100% |########################=
############################################################| Time: 0:00:01=
</div><div>Loaded 2751 entries from dependency cache.</div><div>Parsing rec=
ipes: 100% |###############################################################=
###################| Time: 0:00:01</div><div>Parsing of 1986 .bb files comp=
lete (1985 cached, 1 parsed). 2752 targets, 208 skipped, 0 masked, 0 errors=
.</div><div>ERROR: No recipes available for:</div><div>=C2=A0 /opt/yocto_GE=
/yocto_master_v2/poky/meta-selinux/recipes-extended/findutils/findutils_4.2=
.31.bbappend</div><div><br></div><div>Summary: There was 1 ERROR message sh=
own, returning a non-zero exit code.</div><div>pello@pello-VirtualBox:/opt/=
yocto_GE/yocto_master_v2/poky/build$</div></div><div><br></div><div>Before =
experimenting this error, I have got another one related to the gcc compile=
r version. I have git pull my project and now the error that I got is the o=
ne that I have reported. Anyway, I think that the compilation error must be=
 solved too, but I don&#39;t know how.</div><div><br></div><div>Some of you=
 have told me to switch the Yocto branch to a stable one, but the reason fo=
r what I need to use this one, is that after I need to launch the compiled =
image in Xilinx QEMU, which I have understood that it&#39;s not supported b=
y other branches as could be Morty.</div><div><br></div><div>Do you have an=
y other possible solutions?</div><div>Can any one help me with this?</div><=
div>Best regards,</div><div>Pello</div><div><br></div></div>

--001a113cd3f8881334054aacc875--
