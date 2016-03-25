Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F27EE00CA3; Fri, 25 Mar 2016 11:00:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B318E00C9D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 11:00:02 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id r187so10993024oih.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9FooM3bQF3Fgjt/t3TaBFAgiUO6T5SkdCzxvaRSRyjA=;
	b=0LucSffnoPyg8J7696z3J1mtFN1Fu1DhUd+KrEeCsvcI8DQFJo6+obbRk7fvEmyPoz
	UdYADuLcURgYru+SLDZtqUPbe9HBYPwPOXgLBCBo3s5GQGoBj4dvPrXOHAhrSne89FNW
	CoZtAPIcoXf88TL94peNPmelhKW0ellYoh1jTcGz0R9WfhcnlZckplBu5g9ICIKwFTk3
	VamttNy3eoeFVlIJELR/A2xLh1JOGd89ihJSEhzlbWeSk1JU8I/RwmFzh66O2ehqyZmi
	Q9EK4BX85cTWW3xnoKmrxnlWS6wx63BfJW78CDbHttmgZ3inID9b6bHjksxEnMU3mYDm
	rEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9FooM3bQF3Fgjt/t3TaBFAgiUO6T5SkdCzxvaRSRyjA=;
	b=X48cbH4qBdXdIMB10haknnMiwooET8omux+LtJsc4QX9e46ZRCgBuJ+ZBGlksiW5KW
	vIXUZAMrzwCvt662SJC6bApEWxnN3EJ55T/0oD1jnPUGxQctguuhYAbP9GqJYFRG0Wiu
	lGpi/L/fWCjsaM63VqrvfXrNcsfChrCNl8YT1/LUnh1uuRLDvBjzyRXKiKkCh42yP0IH
	GJdlf5R2nIkG0H7+bv7OKe5ZEQT8BES1GUNIy9Woh958/p4RpSb6QXwCjEuHZbyaIgB8
	rbTQRnB+VHt5gBhQz0YRb4hXkbitX20l4E+vpIj4NPQviMHve2taMF3+VRZ9+m8Df0ij
	Cc8A==
X-Gm-Message-State: AD7BkJLTJRH1bHkqfFgE1PHwp4Do4NwdXshaAGXmPi9UTLwlEotzpwIU+XSM5T/+7INu/NsMji/G0K31IHHlGg==
X-Received: by 10.157.41.70 with SMTP id d64mr1765472otb.116.1458928802006;
	Fri, 25 Mar 2016 11:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Fri, 25 Mar 2016 10:59:42 -0700 (PDT)
In-Reply-To: <56F429FA.7060001@cardoe.com>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<56F429FA.7060001@cardoe.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 25 Mar 2016 13:59:42 -0400
Message-ID: <CABZSBQe-SaaWrYtPj+TuZeBRG1W_3ikP2zCBgepFpUg2DAkwAw@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Derek Straka <derek@asterius.io>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] xen: split the flask package into a policy and tools package
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
X-List-Received-Date: Fri, 25 Mar 2016 18:00:09 -0000
Content-Type: text/plain; charset=UTF-8

LGTM +1, tested.

On Thu, Mar 24, 2016 at 1:55 PM, Doug Goldstein <cardoe@cardoe.com> wrote:
> On 3/24/16 10:31 AM, Derek Straka wrote:
>> Signed-off-by: Derek Straka <derek@asterius.io>
>
> Reviewed-by: Doug Goldstein <cardoe@cardoe.com>
>
> --
> Doug Goldstein
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

