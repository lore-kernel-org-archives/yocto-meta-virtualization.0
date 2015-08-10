Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 672F0E00A6D; Mon, 10 Aug 2015 06:49:05 -0700 (PDT)
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
	*      [209.85.160.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DBB9E007B1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:49:02 -0700 (PDT)
Received: by ykeo23 with SMTP id o23so139180560yke.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mYAM6OQN+QgEctqoiwFvUxym0VwSeuufriIZBJmQaKw=;
	b=aM/OWy26pWbUDjHskBqOaNy2InbdsYoCSCThUAB5jBBf+6r0PwzMNhkAgncI+/yuhg
	1oeEHUQ/drs8E/MG6Dvb5oYuzs9qG4GlvqOhaspACSu20h2yf2lRbJNhpOnugn2VzdhK
	0DpPwbXyt2/ha9yyyg5aA51ohyfXiGBphkUvWmAcxBGlbjBBqiaywNdth6Xyt1TW0K++
	yXgZtda/q3ckh9FaPGUuGBRKr1A4v9unnApxd0kIXqOnRkPGZB+1aEEyazqzQzHfqsZ1
	KvYSvxU9ZM2r9xSvlbOhi7c0fBfA1+uwrtEXLxxMT3717myQ+SdcLHIvMsY8RzmFkKUq
	Kayg==
MIME-Version: 1.0
X-Received: by 10.13.198.2 with SMTP id i2mr21518989ywd.123.1439214541620;
	Mon, 10 Aug 2015 06:49:01 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:49:01 -0700 (PDT)
In-Reply-To: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 09:49:01 -0400
Message-ID: <CADkTA4MSi3_Y4b3n=4TrMxkC2jVYxAK8G2P+=2Ho+FnvohFCWw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 00/11] upgrade recipes
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
X-List-Received-Date: Mon, 10 Aug 2015 13:49:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 4:11 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Li xin (11):
>   python-fixtures: upgrade 1.0.0 -> 1.3.1
>   python-glanceclient: upgrade 0.17.0 -> 0.19.0
>   python-httpretty: upgrade 0.8.7 -> 0.8.10
>   python-jsonpatch: upgrade 1.9 -> 1.11
>   python-jsonpointer: upgrade 1.7 -> 1.9
>   python-keystoneclient: upgrade 1.3.0 -> 1.6.0
>   python-msgpack: upgrade 0.4.5 -> 0.4.6
>   python-oslo.config: upgrade 1.11.0 -> 1.14.0
>   python-paste: upgrade 2.0.1 -> 2.0.2
>   python-pecan: upgrade 0.8.3 -> 0.9.0
>   python-pymongo: upgrade 3.0.1 -> 3.0.3

merged to master.

Bruce

>
>  .../python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb}    | 4 ++--
>  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb    | 5 +++--
>  .../python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} | 4 ++--
>  .../python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb}     | 4 ++--
>  .../python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb}  | 4 ++--
>  meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb  | 4 ++--
>  .../python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb}      | 4 ++--
>  .../{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb}   | 4 ++--
>  .../python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb}          | 4 ++--
>  .../python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb}          | 4 ++--
>  .../python/{python-pymongo_3.0.1.bb => python-pymongo_3.0.3.bb}      | 4 ++--
>  11 files changed, 23 insertions(+), 22 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb} (81%)
>  rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} (78%)
>  rename meta-openstack/recipes-devtools/python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} (77%)
>  rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb} (76%)
>  rename meta-openstack/recipes-devtools/python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb} (74%)
>  rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb} (79%)
>  rename meta-openstack/recipes-devtools/python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb} (73%)
>  rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} (80%)
>  rename meta-openstack/recipes-devtools/python/{python-pymongo_3.0.1.bb => python-pymongo_3.0.3.bb} (72%)
>
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

