Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F322E007BA; Tue, 21 Mar 2017 05:13:51 -0700 (PDT)
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
	*      [209.85.216.173 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.173 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 097E3E00726
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:13:50 -0700 (PDT)
Received: by mail-qt0-f173.google.com with SMTP id i34so129201226qtc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Mar 2017 05:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P4ZWMItvuSSrrz7QBTRIkrugYSvvAGY8Q9pj0oIs4nI=;
	b=l3hQYFUrt93n4fsyhPGuTY38660vwZEMpzXG+qRYOpXcgdJjWgam9vBU8dUQRf91Gy
	OnuMRe0Pk5pntovsHQWKrHLcaY31x5HisKxZgz/G25AtIThQgUGpZLJQ+zxeaOPwqbtY
	FC2ZL26+QLk0lB9SPffI55KWRvVwkHbw0m3hv3IRqv7E2UlTsIBlPIK0cPOQLU5PEiJr
	v7ROs+Ts9zmEJyXOA1K4NKFG37u+/U2dPDjyIhQjuNIUv2ykZ6EOr7LJenTmV6cJ3qYG
	b5E4eEnYY2YHYJ2e5mqvTL+u0YOLAaHF3Y7b53HfmyCRPg9Llz5K0TB6EzKsz4H/HijP
	tVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P4ZWMItvuSSrrz7QBTRIkrugYSvvAGY8Q9pj0oIs4nI=;
	b=VqoNO+dQotLPAADcKw+mq+P4gPaH8k8yxc9X/dbvqqyVrCT4PmpAR1XFy5TSJC6Tph
	FXx8K3C11fjcgBtK+r4598rCs13WihFpRfMyeb403DUu04B6pid9Fo9b94i+jnLWotwl
	JMi5GduZmw4B4fy34fkAVpptC1rMeEi6QEOxDzs6WCVRGJEV0J9aHqAbuZx/Gdtuqrp+
	IhF7ODGsYzz9nN4zzyD2bdghPKgyslWUCCr7anZm1ycttVRti6A5DUmV64Tw9fZny6HO
	5fEDysn0u6EI51MZkcION3NpDfZZDdFrnnZRACDvU6CuF9hz5KfZWcS99zRuk3o6y/r4
	dRgw==
X-Gm-Message-State: AFeK/H3C2w0Powh330UTROnrfJ+DWSvNJfyMZ0Y6GmvgCOxylvRcDWPNNzXZ7r+BVQ9LJ9sB5sTs9khNyzDjPw==
X-Received: by 10.200.55.82 with SMTP id p18mr25259092qtb.285.1490098429662;
	Tue, 21 Mar 2017 05:13:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 21 Mar 2017 05:13:49 -0700 (PDT)
In-Reply-To: <20170321035947.13930-1-raj.khem@gmail.com>
References: <20170321035947.13930-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Mar 2017 08:13:49 -0400
Message-ID: <CADkTA4Nx_FEN+GNzqgc_Wo-8ScE_NCPOdiAOnpqKNLH1kEFAWQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [[PATCH 1/6] go-cross: Remove, moved to oe-core
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
X-List-Received-Date: Tue, 21 Mar 2017 12:13:51 -0000
Content-Type: multipart/alternative; boundary=001a1137b48894a4a7054b3c9314

--001a1137b48894a4a7054b3c9314
Content-Type: text/plain; charset=UTF-8

As I mentioned, I already have a patch for this.

The various go recipes in meta-virt are not building properly against the
oe-core
go compiler .. so I won't be merging any removal of go from meta-virt until
they
are building and are runtime tested.

I have 4 fixes queued for those recipes now, and will do runtime testing
today.

At that point, I'll push the entire queue.

Bruce

On Mon, Mar 20, 2017 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>
> --
> 2.12.0
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137b48894a4a7054b3c9314
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As I mentioned, I already have a patch for this.<div><br><=
/div><div>The various go recipes in meta-virt are not building properly aga=
inst the oe-core</div><div>go compiler .. so I won&#39;t be merging any rem=
oval of go from meta-virt until they</div><div>are building and are runtime=
 tested.</div><div><br></div><div>I have 4 fixes queued for those recipes n=
ow, and will do runtime testing today.</div><div><br></div><div>At that poi=
nt, I&#39;ll push the entire queue.</div><div><br></div><div>Bruce</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Mar 20, 2017=
 at 11:59 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
---<br><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1137b48894a4a7054b3c9314--
