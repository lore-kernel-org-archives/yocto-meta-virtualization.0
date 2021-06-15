Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.8303.1623759056145021251
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 05:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XuUVVn7j;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id nb6so2011815ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jun 2021 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2ppqeQcOMd6dTSzE8IeEM9rboLHegJMz/unIwotf6Y=;
        b=XuUVVn7jvVSGAebTpJo08TDvA9aYxtCsjA3tfYsbXMz0xel6pYaQWBw3vBjcDyLA/u
         SJaVDs2ci5Oza9QKblLCIJD56yJxFVU+OP1d/cZM2FEL37yuz3VP1iqfFD+06JJjajpP
         0ul/TxcwPgtzJc81iseursMdk0T7cTCO1yurFfthXWIikr6nrtcj7/UtAG+UsRKF14xO
         8EqZuJx/8QD/SuuYNldFUAMG0GfLXrvDf3bHBcDhtUSoOyAoMyA8UUsPA1wDUNLk2Znh
         3K9fbsNsCoK7JgWHkvCzPd1frzTEt0B3yYNXjFBCju/QvFFLaB2oGu/px5+Cp4AAuK95
         e7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2ppqeQcOMd6dTSzE8IeEM9rboLHegJMz/unIwotf6Y=;
        b=O+OJiBt4KhIv9pYnI3QeP+VSTlnKe9xvt8bu8h+OtuxkxSbxlRCTM1hfiJg+nOnHzw
         Irsm80wJilq1EfZ42Natj/EI51pQsD688WTXTom0xWKXwNi0m1dVRbcCd03Bt8xQPlbw
         jSewr+8VALaDHBI0L77dSP1HPfXXB+OXopzJmXihZ+5SCigP6dnM1UHlw2uLrGtcXlTC
         +7aqqky6nFd6cFmjeTz2toBSEojCvDH5oU9jk+24zJIbJ1O3Y4tXcvsFFj6VjlA6X/9P
         E7Rx12N+/ElR4K5goe0YpOtuZk37GZW30LSXfI9xoWhAqfug1j1HsBO/hV9xpIovqLUU
         rc+Q==
X-Gm-Message-State: AOAM530jJetk+KIkQHntIQ7Tr/dTjyrOZjtCpfJQfgyf99WnBweD+2MI
	JymnhGvhmR8iSHuHWGD63legaZU0JYoay7bKPYY=
X-Google-Smtp-Source: ABdhPJwrmKqHYRjWWiBf8pq6Bt3aTEn1YSgnYx9n1NH95zca103BupMV8yNOI2gORaMD5Wkzz+04wgBqa21SAcF40VA=
X-Received: by 2002:a17:906:8056:: with SMTP id x22mr19848368ejw.298.1623759054638;
 Tue, 15 Jun 2021 05:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <b345fed3-bf43-178e-70b3-6f3bacdbbb65@axis.com>
In-Reply-To: <b345fed3-bf43-178e-70b3-6f3bacdbbb65@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Jun 2021 08:10:43 -0400
Message-ID: <CADkTA4Oh8V-M-G2OOhhp70ygXNVP8b1qhkV9asJGDCf1=YdvLw@mail.gmail.com>
Subject: Re: [meta-virtualization] [cni] do_compile network issue behind proxy for Hardknott
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 7:31 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> Hi!
>
> After upgrade to Hardknott from Gatesgarth, building cni on a machine
> behind a proxy gives me network errors:
>
> run.do_compile.18062' failed with exit code 1:                      go:
> github.com/onsi/ginkgo@v1.13.0: Get
> "https://proxy.golang.org/github.com/onsi/ginkgo/@v/v1.13.0.mod": dial
> tcp 142.250.74.81:443: connect: network is unreachable
>
> The command that fails is
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-networking/cni/cni_git.bb?h=hardknott&id=6c9b889224cedd42191ef5edc7e1f37b0c8ecfec#n37
>
> and can be mitigated by explicitly setting the proxy environment
> variable on that line:
>
> http_proxy=http://<myproxyserver>:<proxyport>
> https_proxy=http://<myproxyserver>:<proxyport> ${GO} build
>
> Since building with Gatesgarth (where that line is the same in the
> recipe, but the cni version 0.7 instead of 0.8) worked fine I did not
> expect this to happen. Do you guys have any ideas? (Setting the
> environment variable as describe above does not strike me as the
> proper/best solution...)

I have a note written on the paper in front of me "fix cni build for
no-network", and a half started fix. :D

So yes, cni is doing some fetches, due to missing go dependencies and
trying to do a go.mod build. Neither of which we want.

Let me dig up my changs and see how far away they are from being ready for test.

Bruce

>
> BR,
>
> /Joakim
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
