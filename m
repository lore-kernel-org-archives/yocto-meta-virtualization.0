Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B866E00B1A; Tue, 14 Jun 2016 08:01:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4762BE00AF2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 08:00:59 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id d132so156658208oig.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Jun 2016 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=48OvFQBpdUx/ON1tiS5P1byTfrcI7DQxOM62L/EMH/I=;
	b=TtKgBMVS45RS/l+ehSS3wlrsgRTUB+IrwBCfmt3Mlpi3Nx/QFbXsf3rZGBNTQlWWWI
	KItnpSRmtSOWPRlYTcb59YxixfhTwHLIny1QYRfdbO9CGwSMrAlJH+lGACHwzTGzfy7y
	xj2WZQJ8yvJ7E+FBX35wKiClyDqAAI36+EzbVoH8QbKCp6PWzTHxgcIPyEEVNL5hqUsz
	1GZlXVtBaN8e2CGus29kLOVoJRFpQbck8/mPlfosnuQ8M6qQUaLZvbfb8/Ykmg9oKcW9
	OIk2rZ4k3d1c0Tq63DuLFfXsId6VOARGFTxL9+5GXmBoUIGVV9mzEWxMDBh28dzYcJkO
	P4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=48OvFQBpdUx/ON1tiS5P1byTfrcI7DQxOM62L/EMH/I=;
	b=kE1RKqXsQoj9JfTd2JsyV+K//eW7Iw7tV3Q0pbyKJNqz9RT9gYUdOulXGtxsCFV7kp
	g8djnwoPe+UaxZOqMQ6MhGaDLZyO7dPOlDzYqAEBnB18iC7A/Ep0qaaCKUzhaAdMVRSQ
	4vPGRXiFZlzwECqUvOG7t1gukd/1z32AxZuI5J9GTr1BU9S8uq2PVs5MNMUlP3cFtyjt
	i49kRKQcTCLBJ8ydb2IjRJ725w88jB+6uIcFu15PxHKnbmvBid41X3+6wCyZnpozHu/X
	R3rcogOQJvp1LSW6ST6tP7p/44pl9A5jKwBikH21yGC3tkys6pFEC1d2BJeeEmbNrTeI
	45Uw==
X-Gm-Message-State: ALyK8tKRMORE/1L+MlU4aCPoKFHriFXNoL6Ac8gLC9rdAy97iPDHTzIJiqKxIQKmflcfoeJ9yL0uRGiuC9YfLA==
X-Received: by 10.202.91.7 with SMTP id p7mr10782435oib.16.1465916459072; Tue,
	14 Jun 2016 08:00:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.117 with HTTP; Tue, 14 Jun 2016 08:00:58 -0700 (PDT)
In-Reply-To: <CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
References: <CAAPZna21uUF=ZgfWdd5B2aKjmoox0QnCzEz=LDC7=Grx8J4CnA@mail.gmail.com>
	<CADkTA4MRfu2eFEhzeiqWUxoX4dubUqXn-_QQoCPPQLdnAd-e5Q@mail.gmail.com>
	<CAAPZna0tO+C2r66YyfV2YNqM6468V6fNOzu=YH_htoY_6AdXQg@mail.gmail.com>
	<CADkTA4PgXwQwffnXCTxzy9++px_Tc4JdoN9vU74K6HN_Ds6=RQ@mail.gmail.com>
	<CAAPZna372EhYt_3xzb_4HZTJo00Mk25FyL_pkUkKySYvvdk17g@mail.gmail.com>
	<CADkTA4PC2QHp1FXCvMjJ6LA5U8VF-XaYYDtMt3XezdQi5DGPEg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2016 11:00:58 -0400
Message-ID: <CADkTA4M80cc=Bee0temd7KAW9ReytAogqnyWtjLfc5wLvU98Og@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
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
X-List-Received-Date: Tue, 14 Jun 2016 15:01:03 -0000
Content-Type: multipart/alternative; boundary=001a113caba4d0439b05353e45d8

--001a113caba4d0439b05353e45d8
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 13, 2016 at 11:47 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
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

I've now validated the changes locally, and the krogoth branch is updated.

Bruce


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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113caba4d0439b05353e45d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 13, 2016 at 11:47 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><di=
v><div class=3D"h5">On Fri, Jun 10, 2016 at 2:40 PM, Fabio Berton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_bl=
ank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:monospace,monosp=
ace;font-size:small">I&#39;m working with Krogoth and cherry-picked commits=
 from master:<br><br>677f359 go-cross: allow tmp directory to already exist=
<br>3a45dc4 go-native: don&#39;t use host /var/tmp for temp build artifacts=
<br>f17e1ed go-cross: don&#39;t use host /var/tmp for temporary build artif=
acts<br>fb7349e go: add go-cross 1.6<br>d687655 docker: drop obselete depen=
dencies<br><br></div><div style=3D"font-family:monospace,monospace;font-siz=
e:small">It works fine and I don&#39;t get any errors. I think this commits=
 should be backported to Krogroth.<br></div></div></blockquote><div><br></d=
iv></div></div><div>Thanks for the report.<br><br></div><div>I&#39;ve queue=
d the changes here, and will confirm the results myself. Once that is done,=
<br></div><div>I&#39;ll push to the repo.<span class=3D"HOEnZb"><font color=
=3D"#888888"><br></font></span></div></div></div></div></blockquote><div><b=
r></div><div>I&#39;ve now validated the changes locally, and the krogoth br=
anch is updated.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><div><span class=3D"HOEnZb"><font color=3D"#888888"><br>=
</font></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><div>Bru=
ce<br></div><div>=C2=A0</div></font></span></div><span class=3D""><br><br c=
lear=3D"all"><br>-- <br><div data-smartmail=3D"gmail_signature">&quot;Thou =
shalt not follow the NULL pointer, for chaos and madness await thee at its =
end&quot;</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113caba4d0439b05353e45d8--
