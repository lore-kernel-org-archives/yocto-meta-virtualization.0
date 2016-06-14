Return-Path: <fabio.berton@ossystems.com.br>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4CF7E00C1D; Tue, 14 Jun 2016 09:39:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.47 listed in list.dnswl.org]
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5340AE00BFF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 09:39:53 -0700 (PDT)
Received: by mail-lf0-f47.google.com with SMTP id f6so87111509lfg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6DWenMwgXVUXnXbIX9rDciMOyUpbNgdiz5wHT80YrEE=;
	b=tXFWADR+2uh5lVO6zKPmgEv2YUVduUYaKZG4jr8gn9aVc4DzXzv19rkUdAPl4muShm
	TrwsNY9KuJ5Em+xMrZto9jVLiSY2x78IgnHbfnnjrcOc+0BAN6Sciurk2A22UiBWD3dU
	NSLmNFw1iay9r1tcTFHkezojXCK9oH0YGHKI2UT+XIFm0J4vCT9cvvgcQgggrNrgZ4AH
	fDSmVCjS/0uYjhf/LDylsaixLl/1NuMmiNAaToc0zPca9rDbO754HDuNtgvjpwMMnbot
	r1QT+xp+AmzMZqzMZ82XNfaucdeXYfuKYr9TWsFMNe7xC0iS/3pWOx3BzyE8zXTTATmV
	UQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6DWenMwgXVUXnXbIX9rDciMOyUpbNgdiz5wHT80YrEE=;
	b=lZaMe4jj4Z0QsOfyqGncjFnyOPsTyDUfbsjOC9UMzB+AVgY+l/xqqYbFdrVVpi5H6a
	Bynr/FRhmkQ85JzMCYrA56AKHBIXiJCB0AZc0OriQDQJhPwKqZO7ysG8YhRGNPAGQ+AY
	edETsNtHPMhMgOjc1483iDmn3XiWvbkMlqljP7yh98gNGFLBgCX3W61gAu/ELgdfiobU
	IDJu6vjccTrwb9Nx2miDrEzBqSlPTvOfRW8MViffyaF+rIrv6pUoWZIIMMK24XkyZJSx
	9gJ0lBGk/QtUistvgx2gHuJbk3p9mSGpUhgbOllqjBThyIAXdPpAUfLfK6NIVPBEUa2J
	S8eQ==
X-Gm-Message-State: ALyK8tLBsvTPJ148xRmQiR19LSclE4gbBNz0AqeGoy5ikvbFytzkSmvEKP6Xe8V++wZHn0HyVKbKg6V6kBz1zw==
X-Received: by 10.25.32.85 with SMTP id g82mr2337517lfg.184.1465922391268;
	Tue, 14 Jun 2016 09:39:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.5.215 with HTTP; Tue, 14 Jun 2016 09:39:21 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
In-Reply-To: <CADkTA4M80cc=Bee0temd7KAW9ReytAogqnyWtjLfc5wLvU98Og@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
	<CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
	<CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
	<CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
	<CADkTA4M80cc=Bee0temd7KAW9ReytAogqnyWtjLfc5wLvU98Og@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 14 Jun 2016 13:39:21 -0300
Message-ID: <CAAPZna3dixAW3QUgFoynQ9vFJthW4vEtp5v+tqVfaQACNBWmHA@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Jun 2016 16:39:56 -0000
Content-Type: multipart/alternative; boundary=001a1140220e6675d805353fa755

--001a1140220e6675d805353fa755
Content-Type: text/plain; charset=UTF-8

I tested and worked for me.

Thanks.

On Tue, Jun 14, 2016 at 12:00 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Jun 13, 2016 at 11:47 AM, Bruce Ashfield <bruce.ashfield@gmail.com
> > wrote:
>
>>
>>
>> On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <
>> fabio.berton@ossystems.com.br> wrote:
>>
>>> I'm working with Krogoth and cherry-picked commits from master:
>>>
>>> 677f359 go-cross: allow tmp directory to already exist
>>> 3a45dc4 go-native: don't use host /var/tmp for temp build artifacts
>>> f17e1ed go-cross: don't use host /var/tmp for temporary build artifacts
>>> fb7349e go: add go-cross 1.6
>>> d687655 docker: drop obselete dependencies
>>>
>>> It works fine and I don't get any errors. I think this commits should be
>>> backported to Krogroth.
>>>
>>
>> Thanks for the report.
>>
>> I've queued the changes here, and will confirm the results myself. Once
>> that is done,
>> I'll push to the repo.
>>
>
> I've now validated the changes locally, and the krogoth branch is updated.
>
> Bruce
>
>
>>
>> Bruce
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a1140220e6675d805353fa755
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">I tested and worked for me.<br><br></div><div =
class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:=
small">Thanks.<br></div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Tue, Jun 14, 2016 at 12:00 PM, Bruce Ashfield <span dir=3D"=
ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruc=
e.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote"><span class=3D"">On Mon, Jun 13, 2016 at 11:47 AM, Bruce Ashfield <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_b=
lank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote"><div><div>On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <=
span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" targe=
t=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:monospac=
e,monospace;font-size:small">I&#39;m working with Krogoth and cherry-picked=
 commits from master:<br><br>677f359 go-cross: allow tmp directory to alrea=
dy exist<br>3a45dc4 go-native: don&#39;t use host /var/tmp for temp build a=
rtifacts<br>f17e1ed go-cross: don&#39;t use host /var/tmp for temporary bui=
ld artifacts<br>fb7349e go: add go-cross 1.6<br>d687655 docker: drop obsele=
te dependencies<br><br></div><div style=3D"font-family:monospace,monospace;=
font-size:small">It works fine and I don&#39;t get any errors. I think this=
 commits should be backported to Krogroth.<br></div></div></blockquote><div=
><br></div></div></div><div>Thanks for the report.<br><br></div><div>I&#39;=
ve queued the changes here, and will confirm the results myself. Once that =
is done,<br></div><div>I&#39;ll push to the repo.<span><font color=3D"#8888=
88"><br></font></span></div></div></div></div></blockquote><div><br></div><=
/span><div>I&#39;ve now validated the changes locally, and the krogoth bran=
ch is updated.<span class=3D"HOEnZb"><font color=3D"#888888"><br><br></font=
></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><div>Bruce<br>=
</div></font></span><span class=3D""><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><div><span><font color=3D"#888888"><br></font></span></div><span><fon=
t color=3D"#888888"><div>Bruce<br></div><div>=C2=A0</div></font></span></di=
v><span><br><br clear=3D"all"><br>-- <br><div data-smartmail=3D"gmail_signa=
ture">&quot;Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end&quot;</div>
</span></div></div>
</blockquote></span></div><span class=3D""><br><br clear=3D"all"><br>-- <br=
><div data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NU=
LL pointer, for chaos and madness await thee at its end&quot;</div>
</span></div></div>
</blockquote></div><br></div>

--001a1140220e6675d805353fa755--
