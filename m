Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCD95E00D0F; Mon, 25 Sep 2017 05:49:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.180 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82E52E00D0D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 05:49:17 -0700 (PDT)
Received: by mail-qt0-f180.google.com with SMTP id o52so6654011qtc.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 05:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NgdAA1LOmRmzCWMroXj0d58DpqSfrq5C4IDF2gClq7U=;
	b=rSmhlQVWIRr8NehLdg+NMEXVFMf4S0MvAmBfAAUC/EwjDRjK8lDsSQQJbWft4hUOyM
	7nUxcHgZZJZojpcjN2AetgxokNwnt35puNFfhz2vvHycbgXywGOVkfOIhqAWSNvOXdXK
	UWMmxMl1sBczZ8tXQfM0ftMcDwK+AfFh3KeOtDgCVUuMp5BJFGWA23vswmoplsq+BLQa
	BNK/aENqpM9iHKwkfWkbPvSnci/v4QrRx7AyMDVwZ+2YWNn3PqLNOp/GWgVsO6jI25XL
	yoc89E5KWTfUr2gnPWM+EBOUcujmQSMiLV3y4mLsl9Lv/iTI/ihyZEmFmMhJy4CqzzE3
	q+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NgdAA1LOmRmzCWMroXj0d58DpqSfrq5C4IDF2gClq7U=;
	b=bR3LAQZPab8S9qWO47X6j5aSe69C+XXPpazKUxm8rb32AHuekRYCurVHen3xD6B8IP
	OoMbzj1+4CeYeldDcdtqyjKEBJN+bA42P57/CGm/Z3mTSEgXAyWDTZX0cud8e+0ZIlJp
	mbC7haGq10znBpK/pyFfd/wzgfmaacpAw6TWxbkXq124FA6E6XoKLNuKTjjmMdmL4kd9
	V4pGHoiFxz+e01GA9qE5FcrIYrh6Uj/ZPIkUhGd9cblliiEfBoxuyJIOc5ZyP0iu5abM
	n/8Hj231LhpYRiCw5cIrtFugQZMjf6JhUEEJptGbzWKs+/a6ryd/SbmUl7wSJ5gEFKiF
	VDew==
X-Gm-Message-State: AHPjjUiVeC8fdM5EIYIgqSc+/Pnz0ktKj44B7OUECZOFxmr4j4wQEUo2
	e/CL0cqjjWBn5caipGCgxYxPiT5Yl+QnUjx2crY=
X-Google-Smtp-Source: AOwi7QDDc/+jqKmbXpGJ/kXJpM+Pab3Sj+2qRsJzGGn/Hi5j1Z2L6yqJ6kLU5tXYeuoBBQ0VhB/63lcnM2KRxX/R3v4=
X-Received: by 10.200.51.69 with SMTP id u5mr10987988qta.204.1506343756410;
	Mon, 25 Sep 2017 05:49:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Mon, 25 Sep 2017 05:49:15 -0700 (PDT)
In-Reply-To: <1506336011.31732.13.camel@linuxfoundation.org>
References: <20170925084113.30094-1-Qi.Chen@windriver.com>
	<1506336011.31732.13.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Sep 2017 08:49:15 -0400
Message-ID: <CADkTA4M5aiZw8d=cGjempdwjy_gtOpDfiQ_uok5w4h2i2WRmjg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2 1/3] sanity-bbappend.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 25 Sep 2017 12:49:18 -0000
Content-Type: multipart/alternative; boundary="001a1143426482b1fc055a02fc6f"

--001a1143426482b1fc055a02fc6f
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 25, 2017 at 6:40 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-09-25 at 16:41 +0800, Chen Qi wrote:
> > Add a new class, sanity-bbappend.bbclass, to check for whether
> > necessary
> > settings are available for bbappend files in this layer to be
> > effective,
> > and warn users if not.
> >
> > In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable
> > users
> > to explicitly skip the checking to avoid unwanted warnings.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  classes/sanity-bbappend.bbclass | 10 ++++++++++
>
> That is a horrible name for a bbclass, could easily clash with another
> layer.
>
> >  conf/layer.conf                 |  4 ++++
> >  2 files changed, 14 insertions(+)
> >  create mode 100644 classes/sanity-bbappend.bbclass
>
> Looking at this patch series, I suspect this is partly related to YP
> Compatibility v2.
>

It is.

The first series arrived that created a magic distro variable
'virtualization'
that no one would know about, and have no idea how to use it .. as a result
existing configurations would have a silent and drastic change on the
behaviour.

I wasn't about to merge that change, so I suggested that if everything was
to be triggered off a variable, that variable needed to be advertised by
more
than just its use in the code, and more than a mention in a README.

That led to this first effort at making the new distro variable visible.


>
> I do think that its highlighting an issue here in that we have several
> very similar bbappends where the functionality would likely be better
> in a common file and secondly, better in the core recipes.
>
> This layer would then just need to configure it rather than adding the
> config fragements and so on as well.
>
> So yes, I think there is a valid issue here and in many senses, YP
> Compat v2 is probably highlighting a real problem but I suspect this
> patch series is not the way to fix it...
>
> Is there a good reason we wouldn't want "virt" markup in the main
> recipes and it being a configuration option?
>

I'm not following the configuration option 100%. Do you just mean setting
'virtualization' in distro features or some other similar configuration
variable ? If that had to be manually done via distro or local.conf that
would
leave my original concern outstanding.

Bruce



>
> Cheers,
>
> Richard
>
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

--001a1143426482b1fc055a02fc6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 25, 2017 at 6:40 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Mon, 2017-09-25 at 16:41 +0800, Chen Qi w=
rote:<br>
&gt; Add a new class, sanity-bbappend.bbclass, to check for whether<br>
&gt; necessary<br>
&gt; settings are available for bbappend files in this layer to be<br>
&gt; effective,<br>
&gt; and warn users if not.<br>
&gt;<br>
&gt; In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable<=
br>
&gt; users<br>
&gt; to explicitly skip the checking to avoid unwanted warnings.<br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi=
.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0classes/sanity-bbappend.<wbr>bbclass | 10 ++++++++++<br>
<br>
</span>That is a horrible name for a bbclass, could easily clash with anoth=
er<br>
layer.<br>
<span class=3D""><br>
&gt; =C2=A0conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A04 +=
+++<br>
&gt; =C2=A02 files changed, 14 insertions(+)<br>
&gt; =C2=A0create mode 100644 classes/sanity-bbappend.<wbr>bbclass<br>
<br>
</span>Looking at this patch series, I suspect this is partly related to YP=
<br>
Compatibility v2.<br></blockquote><div><br></div><div>It is.</div><div><br>=
</div><div>The first series arrived that created a magic distro variable &#=
39;virtualization&#39;</div><div>that no one would know about, and have no =
idea how to use it .. as a result</div><div>existing configurations would h=
ave a silent and drastic change on the</div><div>behaviour.</div><div><br><=
/div><div>I wasn&#39;t about to merge that change, so I suggested that if e=
verything was</div><div>to be triggered off a variable, that variable neede=
d to be advertised by more</div><div>than just its use in the code, and mor=
e than a mention in a README.</div><div><br></div><div>That led to this fir=
st effort at making the new distro variable visible.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I do think that its highlighting an issue here in that we have several<br>
very similar bbappends where the functionality would likely be better<br>
in a common file and secondly, better in the core recipes.<br>
<br>
This layer would then just need to configure it rather than adding the<br>
config fragements and so on as well.<br>
<br>
So yes, I think there is a valid issue here and in many senses, YP<br>
Compat v2 is probably highlighting a real problem but I suspect this<br>
patch series is not the way to fix it...<br>
<br>
Is there a good reason we wouldn&#39;t want &quot;virt&quot; markup in the =
main<br>
recipes and it being a configuration option?<br></blockquote><div><br></div=
><div>I&#39;m not following the configuration option 100%. Do you just mean=
 setting</div><div>&#39;virtualization&#39; in distro features or some othe=
r similar configuration=C2=A0</div><div>variable ? If that had to be manual=
ly done via distro or local.conf that would</div><div>leave my original con=
cern outstanding.</div><div><br></div><div>Bruce</div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1143426482b1fc055a02fc6f--
