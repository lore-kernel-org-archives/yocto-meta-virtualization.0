Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C764FE00CC5; Thu,  4 Feb 2016 12:55:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 725A7E00CC2
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Feb 2016 12:55:36 -0800 (PST)
X-TM-IMSS-Message-ID: <8512b1010003df6b@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	8512b1010003df6b ; Thu, 4 Feb 2016 15:55:24 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u14KtZ58006627; 
	Thu, 4 Feb 2016 15:55:35 -0500
To: Chris Patterson <cjp256@gmail.com>
References: <56B10C90.8070709@tycho.nsa.gov> <56B126BC.3070304@tycho.nsa.gov>
	<CABZSBQd+vLUkLi-1MPYN9-frgOeUygDuZsDezQWmktiGhkACMQ@mail.gmail.com>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
Message-ID: <56B3BA85.7020008@tycho.nsa.gov>
Date: Thu, 4 Feb 2016 15:54:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CABZSBQd+vLUkLi-1MPYN9-frgOeUygDuZsDezQWmktiGhkACMQ@mail.gmail.com>
X-TM-AS-MML: disable
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: stubs-32.h not found
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
X-List-Received-Date: Thu, 04 Feb 2016 20:55:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 02/04/2016 03:52 PM, Chris Patterson wrote:
> I repro'd this with a fresh tree.  Instead of the depends approach, I
> simply moved the step between do_configure and do_compile, which
> should be OK?
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 5555ed3..d35bc3f 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -782,7 +782,7 @@ do_stubs() {
>      fi
>  }
>
> -addtask stubs after do_patch before do_configure
> +addtask stubs after do_configure before do_compile
>
>  do_configure() {
yes.

