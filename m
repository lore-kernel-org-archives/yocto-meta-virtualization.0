Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3574AE00E8E; Mon, 13 Jun 2016 09:43:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D9FDE00E88
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jun 2016 09:43:33 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id u74so88188927lff.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Jun 2016 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FiC25u/q2rYqQsUjnTCovApSBdtKObalRjv2qhnEZw8=;
	b=qo4HWfpqIH/EDf/DpN+NtflxIGQLb74Z6hs2JuC40WmObnYSc7qSg8e0R/dtsrcYYk
	qLLQMbvElKwV2xUxhDm78LIWdZfl1kkHwP6baLmAG5QprvGCE9YNzQBahVdGxRHI/2Me
	ul/MhpHKUr5hwAk53lnyA3GxfwCLly6A7F0Z+v48WkQItoUS6M6343uWkAO3ItWQZ3ky
	rvCatp3c2IllNBoNYzxr49AZc4W1zglUQcl85YHP8PlY7nQ8/7q94pQTSGXLN5RvtclN
	2JxXL0AYOTRzUZWDXOUgR7bWgPkb0bCpJ/mV496K1lffa0qLVjhLal8/uB/eASTGuZ+W
	3hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FiC25u/q2rYqQsUjnTCovApSBdtKObalRjv2qhnEZw8=;
	b=Y7WSMBhSgob/quhLiXRuAEpd14/QQpLTLmN5yeORSIgldxw4r8XGuhb8CzYZ/f1osd
	UhOb6fqRCF3hkDyN84RMnEoBNV9VFrBYHVk1fnylmU5CQMHxshSUoGCarZIdtOrkxUdd
	SeH56LbqXpZSnMKdE/XRAWfXi4Xs4u6OBMCu9J8nmUHVmM8uHjxDzcKz37P38Brm0Rx9
	asjspG1fB2tdvD2Xw4+owjOQbefm7jl2FFm2Udq1Ph3SoY0c4f0js013UXbZKeAPrDhf
	H5qLRla4VLuyWvUIzwBmpLKVBZ3KvBfHg2cjlpwbp9fcnOsZ2S7jh+UpZd6nOJJoTypI
	yGOg==
X-Gm-Message-State: ALyK8tJ05YhnXozSQUOK5SroNmqdhQlSYeQWHoMPKSIrFdQQj4ZFuGKeKll7kcATD4XhEo48tFo8ahf6cCDWAQ==
X-Received: by 10.25.157.142 with SMTP id g136mr624641lfe.216.1465836211010;
	Mon, 13 Jun 2016 09:43:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Mon, 13 Jun 2016 09:43:01 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
	<CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
	<CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
	<CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 13 Jun 2016 13:43:01 -0300
Message-ID: <CAAPZna0+=9jyF6Z4ADYe+JB+XKGZMt5esKTY2j9VjE9JhQQTtA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [krogoth] Golang errors when building Docker
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
X-List-Received-Date: Mon, 13 Jun 2016 16:43:35 -0000
Content-Type: multipart/alternative; boundary=001a11410b7aa8172505352b9615

--001a11410b7aa8172505352b9615
Content-Type: text/plain; charset=UTF-8

Ok.

Thanks!

On Mon, Jun 13, 2016 at 12:47 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
>
>> I'm working with Krogoth and cherry-picked commits from master:
>>
>> 677f359 go-cross: allow tmp directory to already exist
>> 3a45dc4 go-native: don't use host /var/tmp for temp build artifacts
>> f17e1ed go-cross: don't use host /var/tmp for temporary build artifacts
>> fb7349e go: add go-cross 1.6
>> d687655 docker: drop obselete dependencies
>>
>> It works fine and I don't get any errors. I think this commits should be
>> backported to Krogroth.
>>
>
> Thanks for the report.
>
> I've queued the changes here, and will confirm the results myself. Once
> that is done,
> I'll push to the repo.
>
> Bruce
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a11410b7aa8172505352b9615
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Ok.<br><br></div><div class=3D"gmail_default" =
style=3D"font-family:monospace,monospace;font-size:small">Thanks!<br></div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jun=
 13, 2016 at 12:47 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D=
"h5">On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.bert=
on@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:s=
mall">I&#39;m working with Krogoth and cherry-picked commits from master:<b=
r><br>677f359 go-cross: allow tmp directory to already exist<br>3a45dc4 go-=
native: don&#39;t use host /var/tmp for temp build artifacts<br>f17e1ed go-=
cross: don&#39;t use host /var/tmp for temporary build artifacts<br>fb7349e=
 go: add go-cross 1.6<br>d687655 docker: drop obselete dependencies<br><br>=
</div><div style=3D"font-family:monospace,monospace;font-size:small">It wor=
ks fine and I don&#39;t get any errors. I think this commits should be back=
ported to Krogroth.<br></div></div></blockquote><div><br></div></div></div>=
<div>Thanks for the report.<br><br></div><div>I&#39;ve queued the changes h=
ere, and will confirm the results myself. Once that is done,<br></div><div>=
I&#39;ll push to the repo.<span class=3D"HOEnZb"><font color=3D"#888888"><b=
r><br></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><d=
iv>Bruce<br></div><div>=C2=A0</div></font></span></div><span class=3D""><br=
><br clear=3D"all"><br>-- <br><div data-smartmail=3D"gmail_signature">&quot=
;Thou shalt not follow the NULL pointer, for chaos and madness await thee a=
t its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>

--001a11410b7aa8172505352b9615--
