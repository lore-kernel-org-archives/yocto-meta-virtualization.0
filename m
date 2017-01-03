Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B592E0083D; Tue,  3 Jan 2017 08:56:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 517CAE007D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 08:56:13 -0800 (PST)
Received: by mail-qk0-f193.google.com with SMTP id n21so51107439qka.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 08:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DSWR+IUoqdcm6F2OKUUqfh2PVKee0djLT9kmabHLY4g=;
	b=jCofLc+ctZC5cCAH8TPGRl3cYckLVK196j6vvTuNymCd0cHJXHbGiZbvsuO0bwnTyn
	KxzIGdVSZAeHeeJ9GR1Gxb+CKkIaq8Hh2+r1bAsIycWqnYm4UNCj2v0TOuXyRLXad//V
	KlVj4r9THipTyAC5yahcz3smXU6GCefcZnzMTHjO79bJOklQyJ6bcdcPLTQy+aWqnUTo
	hwHmOALMn/zoJRqWB4BPQIJHDhUhtbksQkDrNM0sNbfst4bZDOMxqyxJVBZBwwWPnOJA
	Cu6Wp/KFBLhn6cIS3ltxxQfIgITxpSoaLJga1v/cLm4WXv1tPAVJcVkaPIYFB6x4jaMR
	LYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DSWR+IUoqdcm6F2OKUUqfh2PVKee0djLT9kmabHLY4g=;
	b=T73qskodKhcOCVBfUAZlDJPMXA8AqlmiHjXU6tDsviRnvw9i76jnSulTX+eftymb4Y
	PmNOee5WsWRu1IF4p5RHidFyROBJIZLeM+7rpoguE72jRrBQrnms3q+ECRigy/2nOFuH
	ESem8i4kRFBDfLHYYjslEUMCs35wIWhOHnlHQ3QTMaVRpByHUp88um/VIX0ojNM2UdCx
	HjXQmEpl62DVBqVif/u7SS0DbSIEzV0O2eVG/zp/ycni9Xq+7/ekb6fs0g3qnkNiUxss
	rxupiYA7VtSDVJpy4IWYwPYQjdiSU7hf14vgKWIL+oDH+Z/1jvL57h/Z24meX111hJxi
	5rCw==
X-Gm-Message-State: AIkVDXLn++R6A1tlI3j/AN4vo6jsobOtNoLwQRM3q/jKJybEE7BAz4BLG5yepVvS1NPyE8i+laLXNaL5nnqZFw==
X-Received: by 10.55.114.2 with SMTP id n2mr36358265qkc.318.1483462573212;
	Tue, 03 Jan 2017 08:56:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Tue, 3 Jan 2017 08:56:12 -0800 (PST)
In-Reply-To: <e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
	<e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Jan 2017 11:56:12 -0500
Message-ID: <CADkTA4MD+oLkJ_5-O9e9uBazXBM_g0G3Exb2Uz8+2vEPTA_N=A@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization (krogoth)][PATCH 1/5] xen: switch to updated download URL
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
X-List-Received-Date: Tue, 03 Jan 2017 16:56:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be68b6f2ca0545338b91

--94eb2c05be68b6f2ca0545338b91
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 3, 2017 at 11:23 AM, Doug Goldstein <cardoe@cardoe.com> wrote:

> On 1/3/17 9:31 AM, Bruce Ashfield wrote:
> > You didn't follow up to patch 1 and 2, I assume these are for the same
> > branches
> > as patches 3 -> 5 ?
> >
> > Bruce
>
> No. Actually 1 and 2 are only for krogoth. Sorry for all the confusion.
> I realize I should have sent this differently for better clarity.
>

hah. Now that you said that, I see the krogoth in the subject. Post holiday
brain! :D

Bruce


>
> --
> Doug Goldstein
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05be68b6f2ca0545338b91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jan 3, 2017 at 11:23 AM, Doug Goldstein <span dir=3D"ltr">&lt;<=
a href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1/=
3/17 9:31 AM, Bruce Ashfield wrote:<br>
&gt; You didn&#39;t follow up to patch 1 and 2, I assume these are for the =
same<br>
&gt; branches<br>
&gt; as patches 3 -&gt; 5 ?<br>
&gt;<br>
&gt; Bruce<br>
<br>
</span>No. Actually 1 and 2 are only for krogoth. Sorry for all the confusi=
on.<br>
I realize I should have sent this differently for better clarity.<br></bloc=
kquote><div><br></div><div>hah. Now that you said that, I see the krogoth i=
n the subject. Post holiday brain! :D</div><div><br></div><div>Bruce</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Doug Goldstein<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c05be68b6f2ca0545338b91--
