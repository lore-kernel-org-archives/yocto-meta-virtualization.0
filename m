Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B04FE00AF2; Tue, 22 Dec 2015 05:01:05 -0800 (PST)
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
	*      [209.85.223.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CF36E00457
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 05:00:59 -0800 (PST)
Received: by mail-io0-f178.google.com with SMTP id e126so185779722ioa.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 05:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=i6K1HLUwMU+ECAOcvBdNtQVCgVzL5tH9kwdwOS37vhg=;
	b=fjEtxtPLC+74CTDu+9FbgYNQ/QAQYxZ1Wvf486OQByfVCSmUWVPCdcYxz1CNlzGDfj
	r/CkF05X7bMxFUULIjYvUK9GCK184k1a5Lx7k42spCqQJ8EEcLuG6PqKm3Z+agABKDJA
	B3iTr2jQvGB0s0e3uULUgH5D9k2Re1CqbJ2yCWKD34J2+2YY8mgqXAcZ3nHOhSM+fCza
	J/0HRmfRMI/C0/4wI8BF1y7FqCk/G2mK7ICK5T+ZVR3pvjIgSo/MgqaM8t2xpUUGF5iS
	tdVMQOuJneIoH/eBvUT27k+4FW8bCjRin7SWXL1xx7dc2q+oznOZ9xogecMdT5YepMuO
	qz4g==
MIME-Version: 1.0
X-Received: by 10.107.33.203 with SMTP id h194mr23014526ioh.108.1450789259075; 
	Tue, 22 Dec 2015 05:00:59 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Tue, 22 Dec 2015 05:00:59 -0800 (PST)
In-Reply-To: <5678E380.5070100@cardoe.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E380.5070100@cardoe.com>
Date: Tue, 22 Dec 2015 08:00:59 -0500
Message-ID: <CABZSBQcv5sN27398FjimLBixQ0JSxKUr+nwRs+3JwRunzeWscQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Dec 2015 13:01:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 22, 2015 at 12:45 AM, Doug Goldstein <cardoe@cardoe.com> wrote:

> Any reason why you can't work with upstream on a solution to the headers
> cross compile issue?
>

I wouldn't declare that it is a bug, but it sounded like upstream just
wasn't "finished" yet.  If you look at the commit that introduced it,
it was deemed to be "simplistic" and was meant only for native builds.

commit 6f1d3ce238905fc7b4c563a3611576ca25a09a49
Author: Keir Fraser <keir.fraser@citrix.com>
Date:   Wed Jun 17 07:21:03 2009 +0100

    Introduce mechanism to check standard conformance of headers

    While pretty simplistic, it appears to serve the purpose at the moment
    (i.e. it spotted two places where a GNU extension was used withou
    proper preprocessor conditionals). The "simplistic" here includes that
    the checking gets only done for native builds, and ia64 gets excluded
    due to its arch-specific header intentionally (for whatever reason)
    checking that anonymous struct/unions can be used.

    Signed-off-by: Jan Beulich <jbeulich@novell.com>


Since it appeared to be a sanity check (for developers?), I didn't
think it was worth digging in too far.

But since you asked!! I did revisit and it actually looks like the
root problem was that CXX is being dropping its OE cross flags (most
importantly, --sysroot).

It appears that CXX needs to be added to the list of variables updated
in ${S}/config/StdGNU.mk.  I'll fix that and post a v2 shortly :)

Thanks!
-Chris

