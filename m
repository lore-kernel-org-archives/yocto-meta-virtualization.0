Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5BC6E010B7; Fri,  9 Oct 2015 12:05:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.170 listed in list.dnswl.org]
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C556E00AD5
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Oct 2015 12:05:09 -0700 (PDT)
Received: by ykft14 with SMTP id t14so87321552ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 09 Oct 2015 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Id0a2qL61cpspmjFuo7/g5DIscZ4b3acAUBbor+HnpE=;
	b=wWFs04hTJF3K9cWwZhfBisG0HLQKO/E5lyNHKnfNv9nExzGDPzISAoh0fYVWg9o8BS
	M33n/7RUmvit7iFXHOEPpHoBVqr6PAQZhKSt7E4ZueDeCMxHeqhf3E2uj+ufSc2X/26p
	llLS+tn1gr5JRSbxlgOqwnzmfMOcBnMqJNVCOKPygFLnLSrt3Wd5g7dPUATyclBlwzuv
	hL5mojlrxdqZ9FZjnt8HoWwJCifOV9xhFeyTBiNxVI47vX7Qup9ezXpPA8nTAi7Pqo6Y
	4QUXlDli523zejEtElGwtjTTcclFXUKmAWnr7R0AGUU+0WB4BcQBvfB235oLcYy93IIR
	WUaw==
MIME-Version: 1.0
X-Received: by 10.129.4.207 with SMTP id 198mr11738187ywe.320.1444417509253;
	Fri, 09 Oct 2015 12:05:09 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Fri, 9 Oct 2015 12:05:09 -0700 (PDT)
In-Reply-To: <1444413018-15865-1-git-send-email-josep.puigdemont@enea.com>
References: <1444413018-15865-1-git-send-email-josep.puigdemont@enea.com>
Date: Fri, 9 Oct 2015 15:05:09 -0400
Message-ID: <CADkTA4NDnZ1pNULp0sPCcJ_4bVqkQvXq3E0gZxh6FdN=bsG2Yg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido/kilo][PATCH] Remove recipes
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
X-List-Received-Date: Fri, 09 Oct 2015 19:05:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 1:50 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Some recipes are already provided by other layers that we depend
> on, so no need to maintain them anymore. Indicated in the patch are
> those that changed versions, otherwise they are the same.
>

Same as the other reply, I won't apply this patch as-is, since I can't count on
the versions or integrated testing of the outputs with the rest of the stack.

bundler is still probably ok to remove, but it needs to be split from
the others.

Bruce

> openldap is already provided by meta-oe, but since I have not tried
> openldap, I didn't remove it. The recipe in meta-oe has preference over
> the one in this layer.
>
> Josep Puigdemont (1):
>   Remove recipes already provided by other layers
>
>  .../recipes-devtools/python/python-boto_git.bb     | 20 ----------
>  .../python/python-decorator_3.4.0.bb               | 17 ---------
>  .../recipes-devtools/python/python-jinja2_2.7.3.bb | 31 ---------------
>  .../python/python-markupsafe_0.18.bb               | 20 ----------
>  .../recipes-devtools/python/python-mccabe_0.2.1.bb | 21 -----------
>  .../recipes-devtools/python/python-mock_1.0.1.bb   | 24 ------------
>  .../python/python-msgpack_0.4.5.bb                 | 17 ---------
>  .../python/python-prettytable_0.7.2.bb             | 24 ------------
>  .../python/python-pyflakes_0.7.3.bb                | 21 -----------
>  .../python/python-pyparsing_2.0.1.bb               | 17 ---------
>  .../python/python-pyudev_0.16.1.bb                 | 17 ---------
>  .../recipes-devtools/ruby/bundler_git.bb           | 33 ----------------
>  .../memcached/memcached/configure.patch            | 13 -------
>  .../recipes-support/memcached/memcached_1.4.17.bb  | 44 ----------------------
>  14 files changed, 319 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-boto_git.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
>  delete mode 100644 meta-openstack/recipes-devtools/ruby/bundler_git.bb
>  delete mode 100644 meta-openstack/recipes-support/memcached/memcached/configure.patch
>  delete mode 100644 meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

