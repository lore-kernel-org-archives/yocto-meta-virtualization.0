Return-Path: <edwingate8@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1528FE00C00; Tue,  6 Oct 2015 09:28:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (edwingate8[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0484E00843
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Oct 2015 09:28:37 -0700 (PDT)
Received: by lbcao8 with SMTP id ao8so79699843lbc.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Oct 2015 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NH4smSuxfyKeGVVLtJ6eDf2JzontLCrMQQ4uh+csCzw=;
	b=jzlEskD1E663sekBEl9ZKo0T3JeYXPhjZuOi7PcvYqwbyKJDLieJB8yJWekhrhiNLC
	bO7UJ/UVb/D/aX6N7fqXHUw7MiLWeno15J+CrS9n9Tu/t8uxwu7b3kmSn2nd7U2SKruT
	ZWTqZsT8XtYt/vNy/7jRHJV/rOmLdyYhdOOjSWHrw6X/2+mfq9H8Ia3g8rAaIM04PD8W
	I6a9AMtqXUg/fkTHqaYGFGq75huwJYzEqIHfIHGvsmaPwq3pAlmfJGiIa97O1MINEUOx
	ojAxHjKf3H2tf/e5nfli1krx/lH+MvLthCisdF8JY53NhxPbqWkunKEvhqhj7FR1Uvjr
	Jj3g==
MIME-Version: 1.0
X-Received: by 10.25.16.163 with SMTP id 35mr9983112lfq.62.1444148915432; Tue,
	06 Oct 2015 09:28:35 -0700 (PDT)
Received: by 10.114.245.38 with HTTP; Tue, 6 Oct 2015 09:28:35 -0700 (PDT)
In-Reply-To: <20151005211737.GA1393@iapetus.enea.se>
References: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
	<20151005211737.GA1393@iapetus.enea.se>
Date: Tue, 6 Oct 2015 09:28:35 -0700
Message-ID: <CAGMdoF=EXFuua4=KXLVYXwHoKha8U+=H9twbsG8g6Wj2n=S=Og@mail.gmail.com>
From: Edward Wingate <edwingate8@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: python setuptools recipe
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
X-List-Received-Date: Tue, 06 Oct 2015 16:28:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 5, 2015 at 2:17 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> I just had the same error and it was due to a missing build dependecy,
> maybe adding this dependency to the recipe might solve it:
>
> DEPENDS += "python-versiontools"
>
> I've attached a recipe for python-versiontools, in case you didn't have
> it already. Hope it helps.

Thanks Josep, that's exactly what I did (and what Bruce first said to
do) to solve the error.  I just went off on a tangent due to incorrect
interpretation of actions I took.

