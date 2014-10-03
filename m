Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCBFEE00887; Thu,  2 Oct 2014 20:26:39 -0700 (PDT)
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
	*      [209.85.215.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFC37E00749
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 20:26:33 -0700 (PDT)
Received: by mail-la0-f46.google.com with SMTP id gi9so321221lab.33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 Oct 2014 20:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KTlFbRlBSQjhY9n91AczIswJkVu3rrPX8PgCxFg5SgQ=;
	b=qcjk3SUMDB70yG7kUhBlgSutGL6ktUkdU8RWGSg0cGJ7eA5wdfeE42bEEBU/AsoWVa
	Bjt5m/9TCnSP9RhW2DpToaeIx7JXRIjO6AIABxQZ3lQzVkow9erM5JchGtfeC9ZEbZBq
	jizLt2TTbllSAzX13cuIkwW+Ho0ay4lQZspurpTIurhVSB9XDUru5SoB/MTm10BlsFvT
	7yyxnrUdKoCgRva1dBiqK7x0MuFRPGqNboK74tXe64eogdQsw7JeMV+vaJ+uvcjkyJ+5
	MwVTPEQJ6GIse8CQqidzsof+AxLhqGdKP+UL6BokWNQ/G3wSxAhHqNT+alHGDcX56qC7
	/s7Q==
MIME-Version: 1.0
X-Received: by 10.112.163.103 with SMTP id yh7mr2413168lbb.73.1412306792161;
	Thu, 02 Oct 2014 20:26:32 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Thu, 2 Oct 2014 20:26:32 -0700 (PDT)
In-Reply-To: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Thu, 2 Oct 2014 23:26:32 -0400
Message-ID: <CADkTA4PORECng=RgNQuhH3obdkV2bayio=PPEdPV09pj44PwsA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: lxc: Update version to 1.0.6
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
X-List-Received-Date: Fri, 03 Oct 2014 03:26:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 2, 2014 at 7:01 PM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Update LXC version to 1.0.6 and rework one of the patches to apply.

Looks fine to me.

merged.

Bruce

>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

