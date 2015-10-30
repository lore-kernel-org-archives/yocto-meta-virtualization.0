Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73FFAE00BE1; Fri, 30 Oct 2015 05:40:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93803E00BDF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:40:41 -0700 (PDT)
Received: by ykft191 with SMTP id t191so73866347ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qQ1xRTEggHzX0ffuFo25+CpcETnGtUL588i4cTT9TTk=;
	b=Uc6w8lWg/f3FwzzOtkQOhwMk8fSEz5MAEHLLSXMz7h+61LaIybCRLUE+gCSU4hHCvL
	Bl/hNx10zIvZUnG5yoiJwn1U/qJY/yhtxULYqdq0uY61vRxmAFqPd9tUMAoRCpLbHRXs
	FSKYSPLi/Al9QBH7F/wGuLuj7Mnj8rfENVkzNWnouwcu09ncc+56y8n8bPExazqOwlW8
	yUT/USiDZdd+NHqkDFM0ABR+9nm5Ne1mCEysBN3pxOOUt7uS33t4KYbxZHtLJF3RPdtU
	Xv586XltjdA6HTgj02e1YWH32IxO0cuSs6P+ohEsXzaxK/qNz3K64BtjZFksezppNevu
	7Ijw==
MIME-Version: 1.0
X-Received: by 10.13.230.194 with SMTP id p185mr6733818ywe.320.1446208840529; 
	Fri, 30 Oct 2015 05:40:40 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Fri, 30 Oct 2015 05:40:40 -0700 (PDT)
In-Reply-To: <1445522968-9127-1-git-send-email-adrian.ratiu@ni.com>
References: <1445522968-9127-1-git-send-email-adrian.ratiu@ni.com>
Date: Fri, 30 Oct 2015 08:40:40 -0400
Message-ID: <CADkTA4Mbhf704GDhFr3omOZO6DHQ3uwbMv7wrC4ZvAyiaw6W+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] go-net: add SRC_URI checksums
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
X-List-Received-Date: Fri, 30 Oct 2015 12:40:43 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Oct 22, 2015 at 10:09 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  recipes-devtools/go/go-net_hg.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-devtools/go/go-net_hg.bb b/recipes-devtools/go/go-net_hg.bb
> index cfea0b8..2ded6c7 100644
> --- a/recipes-devtools/go/go-net_hg.bb
> +++ b/recipes-devtools/go/go-net_hg.bb
> @@ -11,6 +11,9 @@ SRC_URI = "hg://code.google.com/p;module=go.net"
>
>  SRCREV = "84a4013f96e01fdd14b65d260a78b543e3702ee1"
>
> +SRC_URI[md5sum] = "d899f1e61fcd0d9a8b541314b4737f2c"
> +SRC_URI[sha256sum] = "99360e80a4cb0f969cbd6287ed37d97bb16cbde30268461cb98ef3e3c2aae259"
> +
>  S = "${WORKDIR}/${SRCNAME}"
>
>  do_install() {
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

