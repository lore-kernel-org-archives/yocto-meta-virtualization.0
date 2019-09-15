Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BB51E00BF6; Sat, 14 Sep 2019 20:53:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA322E0043B
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:53:03 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id r8so46292752iol.10
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 20:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=V+VrfwznJqT3LtyQuYR0ZcMVUdNW+idQ5bVIa2LLiB0=;
	b=MZf026St/5hDUHHkjydwmAGZp/wkV3+VDg+IpRpxL6qvuuf486z/lqbkE3jVmTHoRF
	SNBg6wt72P5822S7mTNaw6np0e98t8mb2fhb1mvrylREjBrpkPZKkDMNEDFxA+AO/XiS
	oLwYxRj+KPHohl/N8miYKMkocfwtkrU6zvI1k46CmU3Kwwcb0vtn07VH3Ufs7OKeWOic
	xIciQUFtlwzuKsH6AGeyk6me7puFd622EV+pRYJJQVkZvI/TUO1GS9pvvu5Wf9nMcaH4
	5IepIBXmBpFyRTL5538OPv8rp+jGi7c5VSI+09mL4Yer9mwSaTNeFkKgue41Jqrpv6p4
	MFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=V+VrfwznJqT3LtyQuYR0ZcMVUdNW+idQ5bVIa2LLiB0=;
	b=XqVj9d5DNwb4iKitwNnsPyvAcUpyoeOY1cPF3xgY0eYWGcw6YBCl4IveN1Z5sPGkB+
	JO/vHzJueYKowOpU2soGphkg5oLUML+vrR6MSpxaeKswkqQP9aquAKlKSqqMmlvHY2ak
	iYqK8CMxJCFiGntiB+uGiWed/2c6doPd5PpdfIXQ5bVrfdBmqYlWg2Pd/6hfdgWSqHAR
	qNUHvnOdeac9P68wGFa+i4bV80Q+fw6V3jZcrHhVQpz0ozujFA6KB/0OobllIIiCqTht
	oLea6pS3fyZ+gUgN9xrUeeL5CEZUyWJAog/hnPY32kworxYk/qJOWKB7VMwq3LQgI3Sv
	wQ/Q==
X-Gm-Message-State: APjAAAUiiGCKYQ7G5rckRQaUqBKAllbtoaoVj3XzjgE9bWKWBCKBRCzo
	pCJKkhTfJiXuaraT8jICh7g=
X-Google-Smtp-Source: APXvYqycF7VKPuCJpWA/bBr1orxInPSiXWnFtt/OtwnYUJ5mlU/diAIygn+SYQjOyfuBmdooUIxpvQ==
X-Received: by 2002:a5d:9dd7:: with SMTP id 23mr8830269ioo.182.1568519582832; 
	Sat, 14 Sep 2019 20:53:02 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u124sm48796142ioe.63.2019.09.14.20.53.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 20:53:02 -0700 (PDT)
Date: Sat, 14 Sep 2019 23:53:00 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20190915035259.GC3928@gmail.com>
References: <1568318131-30946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1568318131-30946-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: drop LSB bits
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
X-List-Received-Date: Sun, 15 Sep 2019 03:53:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] openvswitch: drop LSB bits
on 12/09/2019 Mark Asselstine wrote:

> openembedded-core commit fb064356af61 [Remove LSB support] dropped the
> 'lsb' recipe which caused openvswitch to throw a dependency fail for
> both sysvinit and systemd builds. LSB init functions for
> log_begin_msg, log_end_msg and others were being used. We now use the
> functions from ovs-lib which are part of OVS and supply the remaining
> ones directly. This allows us to regain the functionality and drop the
> dependency on 'lsb'.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../openvswitch/files/openvswitch-testcontroller               | 10 +++++++++-
>  recipes-networking/openvswitch/openvswitch.inc                 |  2 +-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/files/openvswitch-testcontroller b/recipes-networking/openvswitch/files/openvswitch-testcontroller
> index aad5ad6..57c7798 100755
> --- a/recipes-networking/openvswitch/files/openvswitch-testcontroller
> +++ b/recipes-networking/openvswitch/files/openvswitch-testcontroller
> @@ -40,7 +40,7 @@ PIDFILE=/var/run/openvswitch/$NAME.pid
>  
>  test -x $DAEMON || exit 0
>  
> -. /lib/lsb/init-functions
> +. /usr/share/openvswitch/scripts/ovs-lib
>  
>  # Default options, these can be overriden by the information
>  # at /etc/default/openvswitch-testcontroller
> @@ -89,6 +89,14 @@ running_pid() {
>      return 0
>  }
>  
> +log_begin_msg () {
> +    echo "$@"
> +}
> +
> +log_end_msg () {
> +    echo "$@"
> +}
> +
>  running() {
>  # Check if the process is running looking at /proc
>  # (works for all users)
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 46865bd..37fbe5a 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -16,7 +16,7 @@ DEPENDS += "bridge-utils openssl python3 perl python3-six-native coreutils-nativ
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>          python3 perl perl-module-strict ${PN}-switch \
>          bash python3-twisted python3-six"
> -RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
> +RDEPENDS_${PN}-testcontroller = "${PN} ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
> -- 
> 2.7.4
> 

