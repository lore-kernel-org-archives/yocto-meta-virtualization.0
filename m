Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9863BE0043B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Feb 2014 10:03:46 -0800 (PST)
Received: by mail-la0-f51.google.com with SMTP id c6so12637689lan.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 18 Feb 2014 10:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=PU4x8qH1Q0RZAlkrdpgrESKdPdjUvSxGWgr4XceylKE=;
	b=XtFlfkLtg4+zPqCrZzKi82K+/1Nwv1/cVODy4/L6sRRawrkMOZb9AA/6+D5ealD+TF
	Gyo+YiaXYEEaxOWSzTwRnI8pJC6lg+VKmeb4nfEPVELrtxwTUUMBLb2tslaBubV5LfUe
	nJt5I5dLH9kbJYlwglAeLcEASIfUP/JXiUbrHU2qwxOHuW9IfEkdE2BxelnPwDAa3XIp
	3A36Zf9N42siIlBhkU2W0DlEywLNYYu4mOjsUhe4wGijh/4ZTtvweuWi2lC2dzin+rQB
	a2ITYatA7R0rvHuFHk8i0rSVhGMTfhoPOC+F94mpkoP/p8Draqb1R3N/Ezs/SKKhd3Lq
	iSEQ==
X-Received: by 10.152.37.9 with SMTP id u9mr36494laj.80.1392746624949; Tue, 18
	Feb 2014 10:03:44 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Tue, 18 Feb 2014 10:03:24 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 18 Feb 2014 11:03:24 -0700
X-Google-Sender-Auth: e0_bfnWqQG8MfzBAofFfySoPV4w
Message-ID: <CABcZANnw7DPih712ZFdSaGaghPztgeBsUEW6LV_oQxUCMGAV_Q@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Regarding 7499d6c in meta-virtualization master branch
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
X-List-Received-Date: Tue, 18 Feb 2014 18:03:49 -0000
Content-Type: multipart/alternative; boundary=089e01538410d7a24804f2b217d2

--089e01538410d7a24804f2b217d2
Content-Type: text/plain; charset=UTF-8

FYI, the recipe was modified to add a patch to SRC_URI, but the patch
wasn't checked in.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01538410d7a24804f2b217d2
Content-Type: text/html; charset=UTF-8

<div dir="ltr">FYI, the recipe was modified to add a patch to SRC_URI, but the patch wasn&#39;t checked in.<br><div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e01538410d7a24804f2b217d2--
