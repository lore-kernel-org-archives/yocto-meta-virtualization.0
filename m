Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4AC74E00D27; Wed, 25 Oct 2017 08:36:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.172 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.172 listed in list.dnswl.org]
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CBFEE00D1F
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 08:36:54 -0700 (PDT)
Received: by mail-yw0-f172.google.com with SMTP id l32so331359ywh.13
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Oct 2017 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4IA6vsReee+faq3VVEEZ/k5s+ofxolgYJCgb7cV3m4I=;
	b=LgRcvAO36znFAZ+R8E6zGPvjAPlhS1eT3zEFcLV+RJSlc3MZ7rvHeToU+8byGi11IM
	pPTXvmubYp/TGmq7wuK9wg1qXn6xUOqQfMUyicrfaEQLTyIlh1Xv9slAGC8eF/o7ucqu
	ApSoxbAIxbuyS1iFeNdDT811lCXmFUP3QwhMwfij7/7SHbNZGow49TqVNlkzc+xyyXcJ
	thnocc3RlEMYh870q379hEjnH+61AkN3fVpTjt/4TaNzoAnqYelklj/gqvKptu3+KW/3
	XBxbIDKqNChySy0dgUAshFBjMFXo6RRF2Io+JrLJzgcVoNqbqGH7jWnHfJoPg2mKYKoy
	hlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=4IA6vsReee+faq3VVEEZ/k5s+ofxolgYJCgb7cV3m4I=;
	b=NQdtIUT09Iomp1gWAgT54/4uiY3sSoWRUGQmMHEZUzmJroBPATh1dcGp8BU8NuIxhY
	5xno2g2Cc6HRrS1ai63HHbVRu1rdRmf3ApG+4kLPGvE3Hedn79eGlxfwVmsK31LrQJz8
	XSBtVx5mSSuGxGn1/RYyx1QKk+FNJMCFYYFBeY8XCbz9zerAsTHhMTBuisYcj8lOZRKN
	pceGZqdIr5VBDTWM2HH9gXFo1jUIDoFkej2Uc7i/E7QXhkR32R8CeJWZkx9LXWqlEDxO
	OQe+Q0lOYKnzgyY16PoQa8ikzIENuuqCZ2l2b7Sp+su9zyQFnoY3FXVFUPiEfaaxK9g/
	Z7fw==
X-Gm-Message-State: AMCzsaVZVvkgwbYsAPyUrLvDkPsgKB7kg29FMmAxKL7/9nYM7/tHfl1E
	SnI8Zk/Qa6FSvaNp4GwMt8KWJ2tI87WT1B7K8UE=
X-Google-Smtp-Source: ABhQp+S2cHeXnV/TVHuFEG4brOK8uKeZygzsLwskM4WlJO7IlaGzNG5R0qTANIUXyqDqwMv26M+Ph3gDivfGGLGAars=
X-Received: by 10.37.45.66 with SMTP id s2mr1548846ybe.345.1508945814294; Wed,
	25 Oct 2017 08:36:54 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.179.130 with HTTP; Wed, 25 Oct 2017 08:36:53 -0700 (PDT)
In-Reply-To: <20171020012126.3575-2-kai.kang@windriver.com>
References: <20171020012126.3575-1-kai.kang@windriver.com>
	<20171020012126.3575-2-kai.kang@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 25 Oct 2017 11:36:53 -0400
X-Google-Sender-Auth: 49wX5jo7G6EriszAzVlBPRc9B1Q
Message-ID: <CAPuovE+89Hd2p-Gza3eZWOSAKZ=p7WQEgOXtkfP9CPDLTm2v1w@mail.gmail.com>
To: kai.kang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] xterm: remove bbappend
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Oct 2017 15:36:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 19, 2017 at 9:21 PM,  <kai.kang@windriver.com> wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Add freetype-native to DEPENDS has been done by PACKAGECONFIG 'xft'.

Agreed. This eventual removal (in meta-cloud-services) is even
mentioned in the commit which added this but no patch to
meta-openembedded but no patch was ever sent as far as I know.

Should be good to go.

MarkA

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend | 1 -
>  1 file changed, 1 deletion(-)
>  delete mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
>
> diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend b/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
> deleted file mode 100644
> index bb8c310..0000000
> --- a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -DEPENDS += "freetype-native"
> --
> 2.14.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

