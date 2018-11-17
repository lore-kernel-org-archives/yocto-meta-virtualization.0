Return-Path: <hackdef@hack-defender.mx>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 322F6E00A54; Sat, 17 Nov 2018 01:29:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.166.176 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D916E009AA
	for <meta-virtualization@yoctoproject.org>;
	Sat, 17 Nov 2018 01:29:03 -0800 (PST)
Received: by mail-it1-f176.google.com with SMTP id h193so781913ita.5
	for <meta-virtualization@yoctoproject.org>;
	Sat, 17 Nov 2018 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hack-defender-mx.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=1M05EQjgf/t9wviwxwM3pMzBu3tPGlsQBgPFGVdg1RQ=;
	b=DZq0WG2MI7Uh0Bgw8bnt8KBjpQKsPB2noCTrqkEM/Lqot6xNGdvFmZ9D4RGWQkBjEN
	TYh+IXYTPObrOOCJTTQiagTUQD84DnoaDNdhZqTic2rpes/O+WtdUl1TNpyAYiRiz6gW
	9qoJ34szqlzS4lgoVeu7rFvX7iAVKsL6tCciNf95uQAsnv7gQAJjj90gljbOvrNWTfrd
	QsTroTcQrucuPMvHudOWxbh5MLA5aeMvkO99jDmrNDUPCszv/UrG6u/nLkCoTjA9wVwf
	YsPOaqFY5ho2CxSoLjxLn6C1qZ/u6iWWprD0/A8K1mw0ySl0at67sljYicWi0rWGSy0F
	9bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1M05EQjgf/t9wviwxwM3pMzBu3tPGlsQBgPFGVdg1RQ=;
	b=WQ8wfDhGXpwkHow8vOf95D7tFy8ptArLHd9ObhF1uNQo+5sv87CyDWL3v/L/FWXe4G
	pFckICzLyo5tO2J7y+QVpb6rXoocnR2SOXm8dSWsVPqf2vitS9sGm2Insx8G9detfqgS
	SSnKJE/2H48KQjH1UII/7vsRai2kmvH2cLqb7teeO0XGVQcRLXn3iLbGSbiiIXspQTci
	CIhcZFYDiGQZX9M2qPrPlF0azRkMjCLgAb2sbS7SLnVZYnn9W6PEwJjiJk1mBPoHMouD
	ToJ2P3y5uxyUJBVgvs+OtsZi6lNhlT4Bu8/pXEMpgmhH9IWdL3arFP8fgKDo+82gK6so
	84/w==
X-Gm-Message-State: AGRZ1gJj3csknmIBsLMZZWvuwDuIJ9aCYGICbakHjjUKEQUI2plwgK7v
	B2FT9g3DR8bgTWX/wGyFh6H+YVYqtLhVNklsNMgMw1IL4c0=
X-Google-Smtp-Source: AFSGD/XHrZoowNcEtv8a+EExiT8dZggge47wMLs8dmt1UJYW2FtodalzvkfrGW1rGOTMf4CBsCjOgJIevWKPsIPlLz4=
X-Received: by 2002:a24:d745:: with SMTP id y66mr1309487itg.18.1542446942737; 
	Sat, 17 Nov 2018 01:29:02 -0800 (PST)
MIME-Version: 1.0
From: HackDef <hackdef@hack-defender.mx>
Date: Sat, 17 Nov 2018 01:28:52 -0800
Message-ID: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Request to backport libvmi to krogoth
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
X-List-Received-Date: Sat, 17 Nov 2018 09:29:04 -0000
Content-Type: multipart/alternative; boundary="0000000000001b6daa057ad8ea04"

--0000000000001b6daa057ad8ea04
Content-Type: text/plain; charset="UTF-8"

Recently libvmi recipe was added to meta-virtualization on master branch:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/libvmi/libvmi_git.bb

But I use krogoth branch with my current board, so, tried to copy the
recipe to krogoth branch but throw error on libvirt about: *Nothing
PROVIDES libxl*, then added new dependencies found on libvirt from master
and now throws: *Nothing PROVIDES libdevmapper,* so I guess the best
approach should be to request backporting libvmi to krogoth branch.

Your help is much appreciated.

Please let me know if possible.

Thanks

--
Hector

--0000000000001b6daa057ad8ea04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Recently libvmi recipe was added to meta-=
virtualization on master branch:<div><br></div><div><a href=3D"http://git.y=
octoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/lib=
vmi/libvmi_git.bb">http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualiz=
ation/tree/recipes-extended/libvmi/libvmi_git.bb</a><br></div><div><br></di=
v><div>But I use krogoth branch with my current board, so, tried to copy th=
e recipe to krogoth branch but throw error on libvirt about: <b>Nothing PRO=
VIDES libxl</b>, then added new dependencies found on libvirt from master a=
nd now throws: <b>Nothing PROVIDES libdevmapper,</b> so I guess the best ap=
proach should be to <span style=3D"background-color:rgb(255,255,0)">request=
 backporting libvmi to krogoth branch.</span></div><div><br></div><div>Your=
 help is much appreciated.</div><div><br></div><div>Please let me know if p=
ossible.</div><div><br></div><div>Thanks</div><div><br></div><div>--</div><=
div>Hector</div></div></div>

--0000000000001b6daa057ad8ea04--
