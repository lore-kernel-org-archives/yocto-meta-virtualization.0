Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FC82E009F0; Fri,  7 Aug 2015 07:28:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6594EE003D9
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Aug 2015 07:28:34 -0700 (PDT)
Received: by wibxm9 with SMTP id xm9so68231449wib.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 07 Aug 2015 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Hr8WIrqnwPh8rDGzYQY15AfgXuESnXcl4QaQGyK/qoE=;
	b=SpctPLR6Th4u/bgE+BJKPSNHS8pq9T221ulha+Vr46IvjRknQuy7E9Iq02smk5OEQV
	MboRB0NicGyqPn9jYve+PwnexHke1QymLgU880RgphtPBIukjBO7UTRy97dF0gufu3Sa
	M/hKx2QtvEzXtzl5mV11R89WFYLZ2a0tmEIOgXrLUk046AfvOcqBNF7hjMDLbGz2BxD4
	ssCvUdcYzVyuYdZ7ZexJYEk413kR5tirz3V9Xw/ZlQZjNYeenevhyBU6VpyazYLWaISc
	xenyu8o5bprhfE/mAO0rCdFa2BvsIAls8Y8ZtPNoFRMkqcVzowfySHXEb+rCefGLkx+T
	r80Q==
MIME-Version: 1.0
X-Received: by 10.180.149.146 with SMTP id ua18mr6833871wib.86.1438957714177; 
	Fri, 07 Aug 2015 07:28:34 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.194.201.163 with HTTP; Fri, 7 Aug 2015 07:28:34 -0700 (PDT)
In-Reply-To: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438940396-2186-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 10:28:34 -0400
X-Google-Sender-Auth: zfBmWiIP3aPWrj14qFin2FDiYqA
Message-ID: <CAPuovEKHHGyqezC7tv3JZURxZ22O0dkox9tn8ZcLGMUtNYoBYw@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] ruby.bbclass: Error fix
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
X-List-Received-Date: Fri, 07 Aug 2015 14:28:37 -0000
Content-Type: text/plain; charset=UTF-8

I had intentions of divesting meta-cloud-services of much of the ruby
bits and as such have already got this class merged to
meta-oe/meta-ruby. So be sure to send this fix there too.

Thanks,
Mark

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

