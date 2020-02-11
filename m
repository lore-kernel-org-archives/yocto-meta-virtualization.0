Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.18678.1581464592672640234
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 15:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qsmWwNbf;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 463C5E016D6; Tue, 11 Feb 2020 15:43:12 -0800 (PST)
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
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.167.67 listed in list.dnswl.org]
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D52EE013AE
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 15:43:11 -0800 (PST)
Received: by mail-lf1-f67.google.com with SMTP id r14so197911lfm.5
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 15:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Fpmi25Y/2uhoXHg3mZ2YVZTeOrJ5Ic6iDTrkuwR02I=;
        b=qsmWwNbfAfrlIdwcbd7NuZxkAxaUHq2bD+plVUm0mkuxPNLGCelaWn6iMLKFxBbr6Z
         PXIXgBYN28yHClQR3AFdGibBG5d0eLxf5VHs8T0UeJR+6eP9nOlt73s8kb9p1MvwdHYP
         1vMHRJ41dv1/TWJQC32f+junBtVlbvhIWU+xzi1xExdDHN/HSe8u8nSccIv7n9jw8+VD
         N7/cch+EZeocKAb7DW4ukgYQKocrqc7zCImEJKDHbSfa1cQ4LUSp7ay1zHU/935XwSDC
         ufP8afLzV/76vdvmUDSAnHVa40/FVTXfJWaW+6cecGCkIjSQ42Zs0vT4KisABlgVbeEu
         RN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Fpmi25Y/2uhoXHg3mZ2YVZTeOrJ5Ic6iDTrkuwR02I=;
        b=QIyfpmbXOZF9MfzsTG1+w9QQc2ILOVqp17rYgRtrKV32YqacX6GtvfSOEJ9m9qfUQD
         3TeVDzhVMpdHrp064GejASx2BsX3OhPiv2ookKi/Tf8EXeIOkddA4swWQwDN6Df/Bbbu
         50q4CJBmSfLXpAPfVf5tXemQn1D9gLApcCTpXHh5YSXx918dC97CvLzd2/VR7V4QsJKD
         q1gU9Ly8bVDSu/SISvqKcaDuZVhVRzXkUtAS+6UGLMYwbhNwVsdBU6zbPIcWs1cYflsj
         D/tXx/HC+ZiD0a3sjoe7AFp9TxIQP3Egip+JzP+WAma4MFGn2+r/AQiZQi716uBftZXr
         8Ddw==
X-Gm-Message-State: APjAAAW9YalsFfvTFV8lIZmxwJx2Go20ABavhC4ZbFe95u+z3S2jXIPy
	GdvddMN6Dl/yc+P4emx7UJ3o1VBEVgrt7//wIyBDctac
X-Google-Smtp-Source: APXvYqw4DnnaIUZig1H1fdVtOI9/zmT6NvBDJxzk8aU1PwEStXQSCjOiviFnEAhpc5h75WFWC6NVYAJ9Jqb5T7hkzzE=
X-Received: by 2002:a19:f608:: with SMTP id x8mr4959235lfe.115.1581464590421;
 Tue, 11 Feb 2020 15:43:10 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>
 <20200210050754.3534-20-christopher.w.clark@gmail.com> <CADkTA4Oko4tG+0CkmoexjGzFj2Hg7qVcoh55b46Mp8bcVABnqg@mail.gmail.com>
In-Reply-To: <CADkTA4Oko4tG+0CkmoexjGzFj2Hg7qVcoh55b46Mp8bcVABnqg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 11 Feb 2020 15:42:59 -0800
Message-ID: <CACMJ4GYEDXRPJRxxfm6oSR5TVyukKkzOt5M0BWeUsAPa+3+fPg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 16/16] xen: add contact to recipe README file
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 1:17 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
> >
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > Add myself as a contact for the Xen recipes.
>
> We can also consider a MAINTAINERS file for the layer.

Yes, that looks like it could be a good fit for this layer.

Christopher


>
> Bruce
>
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > ---
> >  recipes-extended/xen/README | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> > index 3686530..5592b48 100644
> > --- a/recipes-extended/xen/README
> > +++ b/recipes-extended/xen/README
> > @@ -1,7 +1,9 @@
> >  Xen
> >  ---
> >
> > -For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
> > +For any issues with the Xen recipes please make sure you CC:
> > + christopher.w.clark@gmail.com
> > + cardoe@gentoo.org
> >
> >  configuring the hypervisor
> >  --------------------------
> > --
> > 2.17.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
