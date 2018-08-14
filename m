Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1091AE009C2; Mon, 13 Aug 2018 21:25:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A450E00948
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 21:25:45 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id l16-v6so12785257lfc.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Aug 2018 21:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VLSovwVCsRvFGXCHisvoL7YuKTQBjNZr8UzMUmTjc2M=;
	b=L6C/Q5xEgq9v2srwm3ay0J7e3DA43njI3MZMk/t2ZlTkUTdMOlNUYmx91ZHO8NRbHh
	deVUiVHT5CSCfAeprTROy3JdqCYohd2IomZj/TX4JqcXSw9LJbfEc2+zlVkossRUSGDD
	7zoOI8DTDWqubwwbeClDqLLoWYAgAEIyLN1jAH0ZpjFG7eDMl1tW3Ucw97gyIvM8NzI1
	IAav+68LdTy3XSYqBo2/5hHHjGDx47UXRdFxF2W+zIYs06O+F29sl4b5IOTvVhdz/pK5
	Lytepcdv63FWCow0LfCPUT12JYyFl/yy234M8kEEjx2FgxZER5giLFEF7RWTi9OcW10o
	MSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VLSovwVCsRvFGXCHisvoL7YuKTQBjNZr8UzMUmTjc2M=;
	b=Liag9lgozL54cNeza2YCD+YmrK4WGmMQXThLj51NA3mWyDjCGeo45WaTG+79mKggoz
	fdkjv1KyegGkhHtiWPXaOyL3j4kIktHtJuCiupmZCT65jAE1ZSFgQhmzJ0D1AYnt8lMu
	O3Fb46dNaVBDIBjh9I5A2DTnTrj6+OHi5KxTz1edX6LOQRtb+3/eySbw4GsyokYpLXUx
	ecvqxBhvsczY+pbgCHEXIK/RuzSbCSxiamrUZwtavXNap2sjowsvhv+g5uPgz8OCa6EK
	Px8p7CetCfOlPNMfFQw+VurlJ6aaGPJo72dnfOkaP+cGnnQfVwyLnLvembPAbT2E2uJ8
	gVXg==
X-Gm-Message-State: AOUpUlE3lNPmjv6Utq2RE2+l6MTE5jrb0bIiuJ8l+IIsCmSCQPUzgs+R
	xPzhzx0mfTf+i04gkMwJp1jyFho1kj8lkHAoI8s=
X-Google-Smtp-Source: AA+uWPzXzh0UKMohf6Jes7StW5ksQyEVtAcZNreajzxBCHtY8rEKn0GMIgBgVeMOYmP9qFsp81iJhzo4pHxRzn5JMsM=
X-Received: by 2002:a19:b519:: with SMTP id
	e25-v6mr12141188lff.119.1534220744328; 
	Mon, 13 Aug 2018 21:25:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:6f11:0:0:0:0:0 with HTTP; Mon, 13 Aug 2018 21:25:43
	-0700 (PDT)
In-Reply-To: <CADkTA4MaDs7ondvm=qko7NdumuOb5OKo-xQ8MZnOXuYQUtopsA@mail.gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MaDs7ondvm=qko7NdumuOb5OKo-xQ8MZnOXuYQUtopsA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 13 Aug 2018 21:25:43 -0700
Message-ID: <CACMJ4GbzhGhOve-iY8gYGFNOwemuh0X88RwBS+Djw6h3YnZQBA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH v2 0/9] Xen: upgrade to 4.11.0
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
X-List-Received-Date: Tue, 14 Aug 2018 04:25:46 -0000
Content-Type: multipart/alternative; boundary="0000000000007909a205735d9a03"

--0000000000007909a205735d9a03
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 7:59 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Jul 31, 2018 at 4:35 PM,  <christopher.w.clark@gmail.com> wrote:
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > This patch series:
> > * Fixes Xen recipe compatibility with gcc 8.1
> > * Adds the Xen recipe for Xen's current version: 4.11.0
> > * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1
> >     - provided to ease backport to older branches (eg. sumo)
>
> This looks sane to me, and the series is now merged to master.
>
> If it is indeed needed on other branches, or specific patches should
> be backported, let me know.
>

For sumo: these three should go in:

commit 6160783cc05769784781ecac7e04dbd4a15ad8f0
    xen-vtpm : fix patch fuzz, whitespace-only change

commit f9650d8997505796883d0ef61bd8ad2a87c2b36e
    tpm-emulator: apply patch to fix memcmp defect found by gcc

commit 9955e81b23eb6bb264b32c5bb02b326097a4ec02
    xen: upgrade to 4.10.1, and apply patches for gcc 8.1 compatibility

thanks

Christopher

--0000000000007909a205735d9a03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 2, 2018 at 7:59 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-">On Tue, Jul 31, 2018 at 4:35 PM,=C2=A0 &l=
t;<a href=3D"mailto:christopher.w.clark@gmail.com">christopher.w.clark@gmai=
l.com</a><wbr>&gt; wrote:<br>
&gt; From: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmai=
l.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
&gt;<br>
&gt; This patch series:<br>
&gt; * Fixes Xen recipe compatibility with gcc 8.1<br>
&gt; * Adds the Xen recipe for Xen&#39;s current version: 4.11.0<br>
&gt; * Upgrades the existing Xen recipe from 4.10.0 to 4.10.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0- provided to ease backport to older branches (eg. =
sumo)<br>
<br>
</span>This looks sane to me, and the series is now merged to master.<br>
<br>
If it is indeed needed on other branches, or specific patches should<br>
be backported, let me know.<br></blockquote><div><br></div><div>For sumo: t=
hese three should go in:</div><div><br></div><div><div>commit 6160783cc0576=
9784781ecac7e04dbd4a15ad8f0</div><div>=C2=A0 =C2=A0 xen-vtpm : fix patch fu=
zz, whitespace-only change</div></div><div><br></div><div><div>commit f9650=
d8997505796883d0ef61bd8ad2a87c2b36e</div><div>=C2=A0 =C2=A0 tpm-emulator: a=
pply patch to fix memcmp defect found by gcc</div><div><br></div><div>commi=
t 9955e81b23eb6bb264b32c5bb02b326097a4ec02</div><div>=C2=A0 =C2=A0 xen: upg=
rade to 4.10.1, and apply patches for gcc 8.1 compatibility</div><div><br><=
/div></div><div>thanks</div><div><br></div><div>Christopher</div><div><br><=
/div></div></div></div>

--0000000000007909a205735d9a03--
