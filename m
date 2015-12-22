Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A36B6E00C1E; Tue, 22 Dec 2015 11:04:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8347EE00ACF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:04:30 -0800 (PST)
Received: by mail-ig0-f178.google.com with SMTP id to4so66250606igc.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 11:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iNo9Jv5wmiF+4+kskvRWcciyJHY3gPO1thDAqw/7HWY=;
	b=uY43A+ooS1OuBIf1aGN1ovzAm+mNkQfRPMGqAALQW5HCT01hK5pDyQlHIQY7tiJrU1
	3E9uV9SaWuP8LxXvJjz5AFhsP/4/31uuURJ+H8EKdqiX1dR2kytWl6AQlG/wZerm/6rX
	n1sShM6b49VV/oWNWLaSz4ZvpHmadNYxDyxM1NTIUEq9Izu7iVcjrYImKf0j9JfRGQSW
	SEF1lQbNskl96iYmrWUToJHfD82HfZvg2m00Balig977QfvKxXYS0gyosrj5SfXR6y4Z
	iUsp0bBguT5u+ETn9W8lI2pYaqCSO5qpS0+dNc76Xdu6fH1F8x3FayZXZIOh8ezBwxX1
	4fCg==
MIME-Version: 1.0
X-Received: by 10.50.13.100 with SMTP id g4mr24450130igc.64.1450811069826;
	Tue, 22 Dec 2015 11:04:29 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Tue, 22 Dec 2015 11:04:29 -0800 (PST)
In-Reply-To: <56796870.20400@cardoe.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E380.5070100@cardoe.com>
	<CABZSBQcv5sN27398FjimLBixQ0JSxKUr+nwRs+3JwRunzeWscQ@mail.gmail.com>
	<56795D81.9020302@cardoe.com> <56796870.20400@cardoe.com>
Date: Tue, 22 Dec 2015 14:04:29 -0500
Message-ID: <CABZSBQdkQhWj2mt0pgJS-yFf1gT2ZGDKFxQGo3ipjExe-DNH4A@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 19:04:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 10:12 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> On 12/22/15 8:26 AM, Doug Goldstein wrote:
>
> I just pushed my most recent branch. Feel free to grab any bits from
> here for a v2.
>
> https://github.com/cardoe/meta-virtualization/commits/xen-fixes
>

Done, thanks for that! :)

