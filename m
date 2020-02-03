Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.5748.1580768060110601651
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J+OjVMlk;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c24so12802914qtp.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 03 Feb 2020 14:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=C1NQqPAvLxHImRA/4ZIqKzDPLaMycNHN1tm4w0DvcEg=;
        b=J+OjVMlk1t9aTpriY6+iJpL3BUvRtTyRPw/TnFzpaCmR3Z5KSQ+CBX2akCtSUpFuC5
         EyZNvJxbQmUw7tLzfyBG3QywmA23Gm1khfi8WZiUaKxfA2Pr15Bn2L3jL+AoNBQxyjuN
         NLFRfnYufbH2TgA5/w55+GX0j74ZJh3QYpurmRqZypQTRkRsRFxj/hT96LajS11oft3Z
         keTQlzSPmEb62hWR5X334WXXLoYqR4AjtIG+xNFNSdGdS8rnBvogw9DwiFRcZBOKT7CA
         JDEUnqPz5xuI2IxsZfIDQWk6CiGE8S4BO7iFkE+KGzc+M+24MUTcOLtnf7fXYrVIzicR
         ZmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=C1NQqPAvLxHImRA/4ZIqKzDPLaMycNHN1tm4w0DvcEg=;
        b=Gc8zC6QEzuT1eCx12opmva9AQnPlQcmQNai5oUFe7cOoBC/baaP80PEx8Z5DEQ0CB3
         fqU+eSEumo5rMnbOH2NRp3CFU1YNa5KbWfrRBe7PYcfA0o2y17h+QoRiUQupVNWNb1+4
         3NuORuNfKE3jUINANbCqOdHtteRudhkaBWdocRWQ8hnbbQFbzwT+KOXAIgodKe9gB+Ho
         cZd4AFFhuKiAm8e1ODXZccLYjMLd6g70aEvE75/vMze+yvIzoTpsqe0pzBEvXP03OWYz
         oGRUknjPG9FLBlxVrAr/LJd9GunFMPtiQ75OBiX/P/zmDTmlpvaBywwXV7fnxCZPr5eA
         OkDQ==
X-Gm-Message-State: APjAAAXOVbTH3xn9NANdgmlF5h8omreEkseQbKGFC3O4BL2g7EC8BmpI
	lSzgg+cvQauUDpdjA6ev+klCtu9mIUc=
X-Google-Smtp-Source: APXvYqzcaBUI63FfAn1gz/a+4KLrW/dGW2QCJ4XE7/oKcNtrfWEYvZd6L/FixMPRIZTnz7+0r2ESYg==
X-Received: by 2002:ac8:7501:: with SMTP id u1mr25901609qtq.149.1580768059187;
        Mon, 03 Feb 2020 14:14:19 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id 69sm9960452qkk.106.2020.02.03.14.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 14:14:18 -0800 (PST)
Date: Mon, 3 Feb 2020 17:14:16 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Tim Orling <timothy.t.orling@linux.intel.com>,
	meta-virtualization@lists.yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
Message-ID: <20200203221415.GC58444@gmail.com>
References: <20200115215414.16007-1-stefan@agner.ch>
 <20200115215414.16007-2-stefan@agner.ch>
 <15EA3791FF24F7E5.21921@lists.yoctoproject.org>
 <87AB11DD-7FE3-46E7-97AA-D3389FA61EDE@linux.intel.com>
 <778ec9ebe7157be64208d54fb001a43e@agner.ch>
MIME-Version: 1.0
In-Reply-To: <778ec9ebe7157be64208d54fb001a43e@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


In message: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
on 16/01/2020 Stefan Agner wrote:

> On 2020-01-16 03:21, Tim Orling wrote:
> >> On Jan 15, 2020, at 4:47 PM, Tim Orling <timothy.t.orling@linux.intel.com> wrote:
> >>
> >>
> >>
> >>> On Jan 15, 2020, at 1:54 PM, Stefan Agner <stefan@agner.ch> wrote:
> >>>
> >>> From: Stefan Agner <stefan.agner@toradex.com>
> >>>
> >>> Bump to latest podman release 1.6.4. The changelog lists some new
> >>> features but mostly bugfixes between 1.6.1 and 1.6.4.
> >>>
> >>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > 
> > Aside from the whitespace errors…
> 
> See comment in reply to the other email.
> 
> > Thank you for fixing this build, this version was not previously
> > buildable for me probably because of the needed patch.
> > 
> > Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > Tested-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > 
> 
> Yes, after the patch things started to work here. FWIW, I also tested
> this on actual hardware, that is where I realized I also have to update
> conman...

As I mentioned in my first replies, i don't normally want to do version
bumps in the -stable branches.

But since this is mainly bugfixes, stays on the same release branch of
the packages AND most importantly .. makes them build/work, i've gone
ahead and done the merge.

Bruce

> 
> Thanks for testing!
> 
> --
> Stefan
> 
> 
> >>> ---
> >>> ...ker-documentation-install-and-genera.patch | 43 +++++++++++++++++++
> >>> recipes-containers/podman/podman_git.bb       |  7 +--
> >>> 2 files changed, 47 insertions(+), 3 deletions(-)
> >>> create mode 100644 recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch
> >>
> >> <snip>
> >>
> >> Whitespace errors:
> >>
> >> Applying: podman: bump to latest release 1.6.4
> >> .git/rebase-apply/patch:36: space before tab in indent.
> >>        $(MAKE) podman-remote-v$(RELEASE_NUMBER)-$*.zip
> >> .git/rebase-apply/patch:43: space before tab in indent.
> >>        @echo "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_TARGET)"
> >> .git/rebase-apply/patch:46: space before tab in indent.
> >>        install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
> >> .git/rebase-apply/patch:47: space before tab in indent.
> >>        install ${SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker
> >> .git/rebase-apply/patch:52: space before tab in indent.
> >>        install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR}  ${DESTDIR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}
> >> warning: squelched 1 whitespace error
> >> warning: 6 lines add whitespace errors.
> >>
> >>>
> >>> --
> >>> 2.17.1
> >>>
> >>
> >> 

> 

