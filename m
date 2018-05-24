Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35176E007DA; Thu, 24 May 2018 13:09:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 185F8E00720
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:45 -0700 (PDT)
Received: by mail-wr0-f194.google.com with SMTP id 94-v6so5313880wrf.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OjME0kjc00YxkvizoPGu7Co4AGDcTrq+GReCgM1cf48=;
	b=s/WI1SHgjQPwdJQvUMU5uNAZd5g09YY6yuLCYtNqYlMDeFd8q7vBLx14pDFTKFkTB8
	LTpZ96YO3svL3m/HI0fP5mnDfmI+rXSNPlV+m1cd8n/ml23O8VzMHPcyADqxdNfADOaa
	rNEHoZm1tACFoYZruizrDHc4JfQ3Np7+SWeH+KL0of/2GIskWYGpLqVJ8cqsMYGqeyTE
	PTXX+aaeEDGYV2GGzry0Jv3fRcACTBxt9yiNCfhow9eyUh028Q5j7IjTPOR6pkux2tKQ
	1glsXmGxJATvnbFFpgy0uwiSyZZFjR5G1ptTPq7Nf50F9n/vrgkWmURmslDjWvswpMSk
	s50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OjME0kjc00YxkvizoPGu7Co4AGDcTrq+GReCgM1cf48=;
	b=VuOUOlDscnJQmZhV4Df0yYXp3OhXOEDMu13kGFjUDfcbwiZ83n2LE8gMVmE4ZvlGC8
	QAPSKDVyly7IflcK56N5Iij0qLlf0Y0599+jGARNlnpNH2AmnATL+f5G3hY2TWP3w+93
	9KCmm+DT0pTlHuV458OMkoNDW6B2fu37wv4RnaOV2A7NweN7Xnb7d9KeLHdwrKTODxCa
	Posw2jBCoTIViI4SQwn3Habis70tlaRmJAk/GqzZg7Q38es0rIiLsKh3tU3Vw5UMZvZz
	OP65CtskwNeZf2E8yfeAEoUj3T8mDOyubqOS7/o3TCT0WLnwbYgb4v6Xbb3/9rlKl87Z
	573g==
X-Gm-Message-State: ALKqPwf/revjeGOzsWQoaWjVQcR54aZYsEmTXXHZzwVOrTLCTa4Upr4L
	T3kd4HvSmM8qOkzszkTZVM/Xjd0k2GyCU0p/wb9Osg==
X-Google-Smtp-Source: AB8JxZocTtchgACEe4Anoxxc9YFbQfGZOw1nnrDknHhxJzRWiP3AflclyxG6+vxDQGAOpeyjARAdcblWXXgWMYkQfSk=
X-Received: by 2002:a19:14ca:: with SMTP id
	71-v6mr5177886lfu.126.1527192584923; 
	Thu, 24 May 2018 13:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 13:09:44 -0700 (PDT)
In-Reply-To: <1527102997-27793-1-git-send-email-mark.asselstine@windriver.com>
References: <1527102997-27793-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 16:09:44 -0400
Message-ID: <CADkTA4P8uDenOt+5Aa26aDKwDVtxp5VbZbZ51FAcTd2c+j9Ehg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] README: cleanup list of maintainers
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
X-List-Received-Date: Thu, 24 May 2018 20:09:47 -0000
Content-Type: multipart/alternative; boundary="000000000000872e37056cf93b01"

--000000000000872e37056cf93b01
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, May 23, 2018 at 3:16 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Raymond Danks <ray.danks@se-eng.com> hasn't contributed any changes to
> meta-virtualization since 2012 and is listed on Linkedin as no longer
> with Sage Electronics since March 2013, having moved to a completely
> different profession (firefighting). So it is almost certain the
> listed E-mail address is invalid and has been for a long time.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  README | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/README b/README
> index f13de08..810f263 100644
> --- a/README
> +++ b/README
> @@ -64,8 +64,7 @@ Maintenance
>
>  Send pull requests, patches, comments or questions to
> meta-virtualization@yoctoproject.org
>
> -Maintainers: Raymond Danks <ray.danks@se-eng.com>
> -             Bruce Ashfield <bruce.ashfield@gmail.com>
> +Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>
>
>  When sending single patches, please using something like:
>  $ git send-email -1 -M --to meta-virtualization@yoctoproject.org
> --subject-prefix='meta-virtualization][PATCH'
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000872e37056cf93b01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 23, 2018 at 3:16 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Raymond Danks &lt;<a href=3D"mai=
lto:ray.danks@se-eng.com">ray.danks@se-eng.com</a>&gt; hasn&#39;t contribut=
ed any changes to<br>
meta-virtualization since 2012 and is listed on Linkedin as no longer<br>
with Sage Electronics since March 2013, having moved to a completely<br>
different profession (firefighting). So it is almost certain the<br>
listed E-mail address is invalid and has been for a long time.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0README | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/README b/README<br>
index f13de08..810f263 100644<br>
--- a/README<br>
+++ b/README<br>
@@ -64,8 +64,7 @@ Maintenance<br>
<br>
=C2=A0Send pull requests, patches, comments or questions to <a href=3D"mail=
to:meta-virtualization@yoctoproject.org">meta-virtualization@<wbr>yoctoproj=
ect.org</a><br>
<br>
-Maintainers: Raymond Danks &lt;<a href=3D"mailto:ray.danks@se-eng.com">ray=
.danks@se-eng.com</a>&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;<br>
+Maintainer: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com"=
>bruce.ashfield@gmail.com</a>&gt;<br>
<br>
=C2=A0When sending single patches, please using something like:<br>
=C2=A0$ git send-email -1 -M --to <a href=3D"mailto:meta-virtualization@yoc=
toproject.org">meta-virtualization@<wbr>yoctoproject.org</a> --subject-pref=
ix=3D&#39;meta-<wbr>virtualization][PATCH&#39;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000872e37056cf93b01--
