Return-Path: <edwingate8@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2F1BE01003; Wed, 30 Sep 2015 12:03:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (edwingate8[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFC52E00AD2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Sep 2015 12:03:07 -0700 (PDT)
Received: by lahh2 with SMTP id h2so58016471lah.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 30 Sep 2015 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s0brcUo0SH68FR/n2YdQGcyloZFX+HlsxCX1M5ybCFU=;
	b=CO/0UmfBF00RNqVpcjSpQmnBczZ71H0UGoWWHJwLQQrpma04FoIeGYlQStu5tElTG9
	rwatkKpRlo6rROmb27PyMvUlPcax9A5NAeOum4P+J7X0QtiSB6MVTMSySsyOreKInJ1v
	jdBnH6p2qWpCAzYLdG8cxGVqub81trOuzB3B9czBAqH4F8Cp0Q1e/4TtwjdxBn7hmlAs
	4px0z5tkbN65dhryfoVeeHwLJk11sYTeMRjI0Aq6Ok3m66ud6lXb/uUNGmnouMNQUHZz
	A3ybXnTiXHL6O2T4X6ocKzgzdgsQiu1CSTwGStO70ILN5ji+YyY8xAVyQ6auy2tRJ72F
	ROYQ==
MIME-Version: 1.0
X-Received: by 10.25.151.131 with SMTP id z125mr1074176lfd.104.1443639785703; 
	Wed, 30 Sep 2015 12:03:05 -0700 (PDT)
Received: by 10.114.245.38 with HTTP; Wed, 30 Sep 2015 12:03:05 -0700 (PDT)
In-Reply-To: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
References: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
Date: Wed, 30 Sep 2015 12:03:05 -0700
Message-ID: <CAGMdoFnzx+hQyV1Gdd0CXAqbR7U7J_uhwcj3A3w6NZPACGX1eA@mail.gmail.com>
From: Edward Wingate <edwingate8@gmail.com>
To: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Wed, 30 Sep 2015 19:03:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 30, 2015 at 11:10 AM, Edward Wingate <edwingate8@gmail.com> wrote:
> I don't know what could be different about gevent-socketio.

The setup.py for gevent-socketio has this line:
setup_requires=('versiontools >= 1.7'),

I manually removed that line and the recipe works now.  What should I
do for permanent solution?  Create a patch?  Or how can I make it work
even with this setup_requires?

