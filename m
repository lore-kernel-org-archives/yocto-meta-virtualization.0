Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12C27E00CF2; Sun, 18 Dec 2016 19:42:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7858E0098A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:42:28 -0800 (PST)
Received: by mail-qk0-f196.google.com with SMTP id h201so567956qke.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 19:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j4Hgv6tzcl9hnT/9CBcAtnuezBy9qwLT2qs3jNlRq/Q=;
	b=n5ATzwKFISkWipR7xevuSy06RLxAX3GLRzQORlQkdR8QSLThYWgv7c7mlhar4gkRba
	thWD8h/wj+9gf5g+w642Q8CsH43/2HGxgObZdaHKR4M6JM1vnXb7niEtL5IQhDWPI3XL
	kDx9QovOs+DmNd5a1ezRpVavZaGFoh3kONlmbgcvd3vK+C8iodgo6mbfadKH0iXs66rs
	Em1+gwotFxS0hTmp9dttOoBdK4z5RaMx//P3NuW9voeSsakDC1nQryRyePX1rUSTcVbn
	DNwm8AAhSJmTWvrI0GIZsf7DOwz7f7HAYn9BDXRieqhzZ0TRk+vYE8qiEjJSePwZ8Tqb
	bR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j4Hgv6tzcl9hnT/9CBcAtnuezBy9qwLT2qs3jNlRq/Q=;
	b=fr7VetuAMlqiBfJWhWXepRN1w9DYX9ZOrM7n6rAoK/ugMDy93wT/QNZlFo53qosF60
	ql4/oVg+fcBgHRyLHXmKM+/KzJmMOaZz1P5bBcRAw8POw+TmpbPpddQJXIBEeLMphTv0
	MFg6ejLfZjJRQigoIm26IrXIukJsuM039IqMFHFBwkfrifdLIwzOZkk1gz6YEbY0Yyt0
	MmuCGmboJhl/Il4pGRArjiZbJ/jUXgCIQVBhVaLOEMvx0VX9kNnLK4J82AJjmoaHaQ3V
	UWqWG1w9sXmPWHLOTi0zsv/e5cB7HaBfF0QjGsBuWiv2r8EaipqplFQjW2xSWPEV7/nC
	I73Q==
X-Gm-Message-State: AIkVDXKTXPkRs8z4x9ZGNU5bEaN5LpL3/ipcuLnyY7kf115NevlBhuKwXJn3KD2by73W7sJyrdgOAqitQ8XnQg==
X-Received: by 10.233.221.135 with SMTP id r129mr333234qkf.56.1482118947908;
	Sun, 18 Dec 2016 19:42:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sun, 18 Dec 2016 19:42:27 -0800 (PST)
In-Reply-To: <64868386-9609-58b5-ebc5-6b85b07843c0@cardoe.com>
References: <1453525283-3307-1-git-send-email-cardoe@cardoe.com>
	<64868386-9609-58b5-ebc5-6b85b07843c0@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Dec 2016 22:42:27 -0500
Message-ID: <CADkTA4O75Rw-NJLxZvi+VzRFey8CkY9SD24EzwfH+4PhMKpV4A@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] README: make it easier to copy and paste send command
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
X-List-Received-Date: Mon, 19 Dec 2016 03:42:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c0438a867b3770543fab5fe

--94eb2c0438a867b3770543fab5fe
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 16, 2016 at 12:08 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/22/16 11:01 PM, Doug Goldstein wrote:
> > The git send-email command on most shells requires the subject-prefix to
> > be quoted and with the trailing quote I always think it is from the
> > README and then realize after the fact I have to edit it. I used $ to
> > imply the shell prompt since that seems pretty common across the
> > internet.
> >
> > Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> > ---
> >  README | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/README b/README
> > index c60044d..2578f90 100644
> > --- a/README
> > +++ b/README
> > @@ -42,7 +42,7 @@ Maintainers: Raymond Danks <ray.danks@se-eng.com>
> >               Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> >  When sending single patches, please using something like:
> > -'git send-email -1 --to meta-virtualization@yoctoproject.org
> --subject-prefix=meta-virtualization][PATCH'
> > +$ git send-email -1 --to meta-virtualization@yoctoproject.org
> --subject-prefix='meta-virtualization][PATCH'
> >
> >  License
> >  -------
> >
>
> Ping? Yes/no?
>

I'm not sure how this slipped through. It looks fine to me, and I'll merge
it shortly.

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0438a867b3770543fab5fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Dec 16, 2016 at 12:08 PM, Doug Goldstein <span dir=3D"ltr">&lt;=
<a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1=
/22/16 11:01 PM, Doug Goldstein wrote:<br>
&gt; The git send-email command on most shells requires the subject-prefix =
to<br>
&gt; be quoted and with the trailing quote I always think it is from the<br=
>
&gt; README and then realize after the fact I have to edit it. I used $ to<=
br>
&gt; imply the shell prompt since that seems pretty common across the<br>
&gt; internet.<br>
&gt;<br>
&gt; Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com"=
>cardoe@cardoe.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 README | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/README b/README<br>
&gt; index c60044d..2578f90 100644<br>
&gt; --- a/README<br>
&gt; +++ b/README<br>
&gt; @@ -42,7 +42,7 @@ Maintainers: Raymond Danks &lt;<a href=3D"mailto:ray=
.danks@se-eng.com">ray.danks@se-eng.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>=
&gt;<br>
&gt;<br>
&gt;=C2=A0 When sending single patches, please using something like:<br>
&gt; -&#39;git send-email -1 --to <a href=3D"mailto:meta-virtualization@yoc=
toproject.org">meta-virtualization@<wbr>yoctoproject.org</a> --subject-pref=
ix=3Dmeta-<wbr>virtualization][PATCH&#39;<br>
&gt; +$ git send-email -1 --to <a href=3D"mailto:meta-virtualization@yoctop=
roject.org">meta-virtualization@<wbr>yoctoproject.org</a> --subject-prefix=
=3D&#39;meta-<wbr>virtualization][PATCH&#39;<br>
&gt;<br>
&gt;=C2=A0 License<br>
&gt;=C2=A0 -------<br>
&gt;<br>
<br>
</span>Ping? Yes/no?<br></blockquote><div><br></div><div>I&#39;m not sure h=
ow this slipped through. It looks fine to me, and I&#39;ll merge</div><div>=
it shortly.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c0438a867b3770543fab5fe--
