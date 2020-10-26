Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.14501.1603727184128220801
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 08:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTIc7SZl;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6792438C06B0
	for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 08:46:23 -0700 (PDT)
Received: by mail-ej1-f68.google.com with SMTP id p5so14277652ejj.2
        for <meta-virtualization@yoctoproject.org>; Mon, 26 Oct 2020 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Whiy6yPBB2/k40PHnpkur8Lcl8cdg6IAJjy+ujUo8ss=;
        b=NTIc7SZlbuuS9lBumbhHxohm3FRkKdGFjPwUgwJQXZN/xZdSKSBIH6uQcXTwrQCxBP
         8EGolawsKq1cQMb5oiCaXtYYHFs6MJEPcndEdV6cEG+LrUWdqyQa2WHkVjHDIjj0IBIz
         fTa8d65YnLr2bZEMHmGkviT8YM3ruZq4mHjKlyr6tO/G23jPoaBPb4ma6blY5+UHvSVl
         oGwlRNIW+whRTYmAqBieH+2MVtYT51+cYSOyg/7U8rilWZAbaKnIpkt1dVMcDFTWHUqb
         T99nTyRkNNXd6vdXzpw8IRcqaQu6Zm4kiAtEPQLSbvcdCRj+Fbmw5UPCEVOxdl3xFZEK
         N11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Whiy6yPBB2/k40PHnpkur8Lcl8cdg6IAJjy+ujUo8ss=;
        b=fI25XkliE6u/BX7oZHjn+fnY4dnnMTZG47aVColQ9rrAHnej63M3tjU6PqXW4rz8hR
         z+WhANka41GnUMEkKgWF1cLe9HfflmuM5o48P7OUp/3ve19WfyVxEgTk1LF34EsGBgPP
         LFJ/Cz0ZYIV0ZbfZiqjBsCndy7/ihVhz8vzcTbn+mlpbhgHzzecct+a2SPzs4EA//Ksi
         KnaGgdN6jdIH0OSzU0GNt7BFGSl6uCg2pNf9+O/GYRGpIE/Tcfve04dX9WfsCBqm3DGZ
         Lbh1isbcB7MP9sU3G2WD+qlsp3hLiZhaVZio/3CS/OmRMR4IS18p8UEyw3riLQHX6P3D
         xw8Q==
X-Gm-Message-State: AOAM533ZLCk5nY6GLMn7Z+Rf+iN//uY+n0BWAQgYbgv3B/pIbVFwpXPO
	JB0mnQOo9fxvdow9itz7yHbHLuLVw31i3Kpi83w=
X-Google-Smtp-Source: ABdhPJxpXwLfHWlRGES1AvtddmvEyaitJNv0gdxxvKrCq3vZDdKI4X2IEDcGG1JTdNKI9yx/+XgKh3xWV9Fc5cNW9hk=
X-Received: by 2002:a17:906:cc18:: with SMTP id ml24mr15457192ejb.298.1603727181871;
 Mon, 26 Oct 2020 08:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com> <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
In-Reply-To: <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 26 Oct 2020 11:46:09 -0400
Message-ID: <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 2:00 AM Joakim Roubert <joakim.roubert@axis.com> wr=
ote:
>
> On 2020-10-21 05:10, Bruce Ashfield wrote:
> > Ha!!!!
> >
> > This applies.
>
> Wonderful, thank you! I guess this is what is called "five times lucky"..=
.
>
> > I'm now testing and completing some of my networking factoring,
> > as well as importing / forking some recipes to avoid extra layer
> > depends.
>
> Excellent!

I've pushed some of my WIP to:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/log/?h=3Dk3s=
-wip

That includes the split of the networking, the import of some of the
dependencies and some small tweaks I'm working on.

I did have a couple of questions on the k3s packaging itself, I was
getting the following
error:

ERROR: k3s-v1.18.9+k3s1-dirty-r0 do_package: QA Issue: k3s:
Files/directories were installed but not shipped in any package:
  /usr/local/bin/k3s-clean
  /usr/local/bin/crictl
  /usr/local/bin/kubectl
  /usr/local/bin/k3s

So I added them to the FILES of the k3s package itself (so both
k3s-server and k3s-agent will get them), is that the split you were
looking for ?

Bruce

>
> BR,
>
> /Joakim
> --
> Joakim Roubert
> Senior Engineer
>
> Axis Communications AB
> Emdalav=C3=A4gen 14, SE-223 69 Lund, Sweden
> Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
> Fax: +46 46 13 61 30, www.axis.com
>
--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
