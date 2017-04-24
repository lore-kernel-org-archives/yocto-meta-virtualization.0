Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15725E00852; Mon, 24 Apr 2017 05:29:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.181 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.181 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75FBBE0077F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 05:29:03 -0700 (PDT)
Received: by mail-qk0-f181.google.com with SMTP id h123so29761462qke.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Apr 2017 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N6pjI6t1Y2GcBUaCP2m4PeK5wyd5HcHRcK6B9+keZpg=;
	b=bFIKT4WCU/5cDu+MV6j3vGPobU7rg+TuQ0sQPBIabr6nhCwVHBRBFW2xFJd+CeMBmT
	gO5+TaloF5i8NZXfFOHWqD0VE3w8s2rd/JuC07vOzV5bk39X5W1c3CQiiCqNY6F0iQf4
	19pcHhDKxPAJ+Szuxd9LPz1dyVcGDw/nof6SDorBgcBPBUAeY5+IaW8UGd2+xXNMT+Ze
	LBOml8nb14R7hcl9LL982m27+FNzkqzD4PJvXWbaxrne6efT9nhEOQpAduYO65UBQ2IT
	cPcoLOH7O6ukqc9T9y4slfIHWeMLHACvDcpo+kOF6VTFHIKAHdUo7qZfv4eGSUkQYz0S
	/spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N6pjI6t1Y2GcBUaCP2m4PeK5wyd5HcHRcK6B9+keZpg=;
	b=i2t0kSil4tfSzYgVo1IgLDcHR1Qn+rM/gTzlTPzYw4Y8He3NrpRBWJ31834OBKrxq8
	dpfBVtVRCa/Nn/1APc+/bjKNzNYUvIv97YJQQG9nQHNMPP9rxn/OBsHhIeXaeMhCMbxn
	6t/1O4orFt50vekXHI1sLjssx30+7T9qqWq0BRgogC8JVOYSoXshpDAEwqklGj3g0tSF
	UzHOfUtL9mSF+zxl/u7N6aUbGsqTIl+qIP3RqMkwzmjIWRTUNpPE1BpVT5HMm3CMqUVA
	CzZHiqhAv/MMaHONZhs4AknNSjU8xj3ma3guRbNVRMC+85c9G2pWOzw1f8Adl46zN/6M
	EkEw==
X-Gm-Message-State: AN3rC/4tk/6byyESqjQRUYuXKgLBEUGwN3JqHCyrLIfeXufjOpkBxYxY
	x9T3RqV7FfyLOgeUNINboApGWHcBJQ==
X-Received: by 10.55.21.154 with SMTP id 26mr17855570qkv.287.1493036942463;
	Mon, 24 Apr 2017 05:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Mon, 24 Apr 2017 05:29:02 -0700 (PDT)
In-Reply-To: <CABORvUgP0PmxFUpj75FwuqkRsNxJPcQBS-3grpXJvbuVDdhRQA@mail.gmail.com>
References: <CABORvUhYiNw4noLMiK=s10qucet3ZAJebFD8fDrELiSJpCQK3A@mail.gmail.com>
	<CABORvUgP0PmxFUpj75FwuqkRsNxJPcQBS-3grpXJvbuVDdhRQA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Apr 2017 08:29:02 -0400
Message-ID: <CADkTA4P9Pj-1_AAnYGBF3BexShpKHQJ_EtPZHzeHYugn-NhuAA@mail.gmail.com>
To: Theodor Gherzan <theodor@resin.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: oe-meta-go provider
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
X-List-Received-Date: Mon, 24 Apr 2017 12:29:32 -0000
Content-Type: multipart/alternative; boundary=001a1147b35c979fcb054de8c0e4

--001a1147b35c979fcb054de8c0e4
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 6:36 AM, Theodor Gherzan <theodor@resin.io> wrote:

> The oe-meta-go provider that this layer suggest (
> https://github.com/errordeveloper/oe-meta-go) seems to no longer be
> maintained. Is it safe to use a new version of it (
> https://github.com/mem/oe-meta-go)? This was forked from the one your
> layer suggest but is actually maintained.
>


Depends on the branch you are using of meta-virt.

If it is anything but master, I haven't been testing it with anything but
the go support we have in meta-virt.

If it is master, only oe-core is needed (and all that I've been testing).

Bruce


>
> Best regards,
> Theodor Gherzan
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147b35c979fcb054de8c0e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 24, 2017 at 6:36 AM, Theodor Gherzan <span dir=3D"ltr">&lt;=
<a href=3D"mailto:theodor@resin.io" target=3D"_blank">theodor@resin.io</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div dir=3D"ltr"><div>The oe-meta-go provider that thi=
s layer suggest (<a href=3D"https://github.com/errordeveloper/oe-meta-go" t=
arget=3D"_blank">https://github.com/errordevel<wbr>oper/oe-meta-go</a>)=C2=
=A0seems to no longer be maintained. Is it safe to use a new version of it =
(<a href=3D"https://github.com/mem/oe-meta-go" target=3D"_blank">https://gi=
thub.com/mem/oe-met<wbr>a-go</a>)? This=C2=A0was forked from the one your l=
ayer suggest but is actually maintained.</div></div></div></div></blockquot=
e><div><br></div><div><br></div><div>Depends on the branch you are using of=
 meta-virt.</div><div><br></div><div>If it is anything but master, I haven&=
#39;t been testing it with anything but the go support we have in meta-virt=
.</div><div><br></div><div>If it is master, only oe-core is needed (and all=
 that I&#39;ve been testing).</div><div><br></div><div>Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div dir=3D"ltr"><div><br></div><div>Best regards,</div><div>Theod=
or Gherzan</div><div><br></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a1147b35c979fcb054de8c0e4--
