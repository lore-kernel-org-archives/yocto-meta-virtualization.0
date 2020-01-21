Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.13476.1579620442735584817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2020 07:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pTH9TWE5;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F134E0144F; Tue, 21 Jan 2020 07:27:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.50 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99929E006EC
	for <meta-virtualization@yoctoproject.org>; Tue, 21 Jan 2020 07:27:18 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id cy15so3375160edb.4
        for <meta-virtualization@yoctoproject.org>; Tue, 21 Jan 2020 07:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=EImW5LSyNGCtdzxnxvoREn7DRzKpPXOHoq5BT5nilC8=;
        b=pTH9TWE5EpBDopli6QSCzhNKq9THDO/xKVvjbW5aw1bIorvREacXEdcWRDYTk+WhLi
         XGgLVowT1088QbsCiNR3W6tAwz63VPRbWsbyJR5MxHjApBQObQPQDp9Aeet0PD7Esche
         CfxOwm2JMFT/jWuOEgkN28imySTGWaVf3lpenvb/Smi0JdJDIiM6uPxfZS7ZOo/88Y2n
         zvuT2SzckQCTKvm/OGla+8gwgmpp+EgN8+8o2O5VIYk2UNGCMtURp+tC72BLSyBCICIb
         5X25/r0LKWRYDHGTQz5706xLtebLRWSpt8ePg4NUNH5iFOQJ89PLbx8VMqi+fM2giFvS
         c7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EImW5LSyNGCtdzxnxvoREn7DRzKpPXOHoq5BT5nilC8=;
        b=cAfvY7gGjET6EOOMN3cUD0PxINOFJUZd9kZADuyfsbWVZyLZ0SmUL8pOv+6nLCHvNM
         /RZFWmRHVLMZVVZN/BEKCtr79vdn8+AV+pe2jonvzP5cHcjZiblCRl7m52pz0SIz+klR
         tsMIns+iI0qQdIQnBSC6PPg8r+/ocGQAucqTndQbZq+uAl9ZkYUjGT0TuxLh7ec40gk0
         8hZo60xTocesbni3pNO3YkJqUNdRW/E2H0Zfac0RnDreCk5W/ytVjPLaXwa7EzHPgzus
         omkh2PtV13CnJbPWn7f2ROxGUQUcryHeLAFksSzeTUntqOj+W66aMa4iE1y+4B7xrTq0
         /3ig==
X-Gm-Message-State: APjAAAWEc11uvnH+ma/E7E1S2i+RmXsOH+5veFaQ+aZNekB+fAckQenW
	pDp2jiRRBGnWMNbqW4JU4VGCCZaUX0xKC/rHVnSMHU2o
X-Google-Smtp-Source: APXvYqyQx+bmGZzizC3drrE7ny+e4cOiLScR0GSBVcug07e4IvRlGMZy8GX2OLyCFp6vwrKdS4rJXyuubnECw1uEX/M=
X-Received: by 2002:a17:906:4bd1:: with SMTP id x17mr5002344ejv.181.1579620437475;
 Tue, 21 Jan 2020 07:27:17 -0800 (PST)
MIME-Version: 1.0
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 21 Jan 2020 10:27:06 -0500
Message-ID: <CADkTA4My4UOJMoWTtCxWCM-DnXaLnpJPvaNxqZey6vHhdZHb0Q@mail.gmail.com>
Subject: python2 removal
To: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Just a heads up that I'm working through the fallout of python2 being
removed from oe-core.

As a first pass, the goal is to make meta-virt parse/build with only
python3 components that already exist. I'll simply drop recipes that
are python2 only, and then

a) create a list of recipes to be updated that folks are welcome to help with
b) eventually create a python2 dependency sublayer if we find
something that we can't live without, but also doesn't easily update
to python3 .. hopefully we won't need (b).

Cheers,

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
