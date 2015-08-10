Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50018E00A7F; Mon, 10 Aug 2015 06:53:51 -0700 (PDT)
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
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8468BE00A5B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:53:49 -0700 (PDT)
Received: by ykaz130 with SMTP id z130so32216888yka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L9c6wWC//XdWXFhIUhYtD0mJ6CWSMqMrFXlDr12nD6o=;
	b=uZ4lrgGb5ebmy6NjMWOtT408eQP07wdbLcV8cnfFIJQfmOZj9oG0ILhxwzFpJKe3iT
	fzD2Yf2LyWADi7+Ed3g48+HUVqZ+LsvPukzEPdgsJqccQvymdIgdc3MYMeeoQnPOKt/7
	lZxa+fs1Ju0pE9XFAKZO3o6dnVqxWTbXwdypnkleEEYM30aozLN7yPalRus9mXz2SjR/
	LEz9dK/6RAmabH00XQ9NuivvK98etwzOy12dq1XxysGpM5vEEnlKBRhslt4G6WVQ4C+i
	5kNFo6Yyg3MCPedFVEpc/1YgYWFMH79pC/IdrlcJgYlGvJzw3B2DhJfbd8a3tlwM2Gww
	R5IQ==
MIME-Version: 1.0
X-Received: by 10.129.46.134 with SMTP id u128mr6175431ywu.92.1439214829382;
	Mon, 10 Aug 2015 06:53:49 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:53:49 -0700 (PDT)
In-Reply-To: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 09:53:49 -0400
Message-ID: <CADkTA4P2P5qnZbV-eNKE9Qt1r-USfEn1fs1qefkdRHcB22+ZaA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] ruby.bbclass: Error fix
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
X-List-Received-Date: Mon, 10 Aug 2015 13:53:51 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Aug 7, 2015 at 5:39 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> When build the recipes which inherit ruby,ERROR will occur as following:
> ERROR: QA Issue: non debug package contains .debug directory: json
> path /work/core2-64-oe-linux/json/1.8.3-r0/packages-split/json/usr/lib/ruby/
> gems/2.2.0/extensions/x86_64-linux/2.2.0/json-1.8.3/json/ext/.debug/generator.so [debug-files]
> So modify ruby.bbclass.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/classes/ruby.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
> index 957abf7..0c842d5 100644
> --- a/meta-openstack/classes/ruby.bbclass
> +++ b/meta-openstack/classes/ruby.bbclass
> @@ -114,6 +114,7 @@ FILES_${PN}-dbg += " \
>          ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
>          ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
>          ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
>          "
>
>  FILES_${PN} += " \
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

