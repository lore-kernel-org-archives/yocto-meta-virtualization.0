Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56C5DE0161F
	for <meta-virtualization@yoctoproject.org>;
	Fri,  4 Oct 2013 10:24:06 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.117])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VS96i-0005yf-FV; Fri, 04 Oct 2013 17:24:04 +0000
Message-ID: <524EF9AE.7090201@twobit.us>
Date: Fri, 04 Oct 2013 13:23:58 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <20131004163952.GA5669@longhaul.twobit.us>
In-Reply-To: <20131004163952.GA5669@longhaul.twobit.us>
X-Enigmail-Version: 1.4.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Subject: Re: [PATCH] Explicitly set CHECKPOLICY path to native sysroot.
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
X-List-Received-Date: Fri, 04 Oct 2013 17:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Probably should add that I'm not very fond of having the path hard coded
like this. Makes for a dependency on the install location from the
checkpolicy recipe. For the short term this fixes the immediate issue
though. Feedback on the "right way" to reference / find this binary
would be appreciated.

Regards,
- Philip

On 10/04/2013 12:39 PM, Philip Tricca wrote:
> This prevents the Xen 'configure' script from using the
> checkpolicy binary from the host system if it's installed.
> ---
>  recipes-extended/xen/xen_4.3.0.bb |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.0.bb
> index 2e1a29f..5d26000 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.0.bb
> @@ -557,6 +557,9 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
>  # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
>  export LDFLAGS=""
>  
> +# use checkpolicy from  sysroot
> +export CHECKPOLICY="${STAGING_DIR_NATIVE}${bindir}/checkpolicy"
> +
>  do_configure() {
>      # fixup qemu-xen-traditional pciutils check hardcoded to test ${includedir}/pci
>      sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak


