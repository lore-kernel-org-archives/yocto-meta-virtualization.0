Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8908DE00D5E; Thu, 17 Sep 2015 08:21:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1F8EE00C54
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Sep 2015 08:21:04 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8HFL489010990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 17 Sep 2015 08:21:04 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 08:21:04 -0700
To: Nam Ninh <nam.ninh@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1442503038-14210-1-git-send-email-nam.ninh@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <55FADA5E.8090008@windriver.com>
Date: Thu, 17 Sep 2015 11:21:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442503038-14210-1-git-send-email-nam.ninh@windriver.com>
Subject: Re: [PATCH 1/2] openldap: fix various build failures
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
X-List-Received-Date: Thu, 17 Sep 2015 15:21:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

merged to master.

Bruce

On 15-09-17 11:17 AM, Nam Ninh wrote:
> Fix wrong hard-coded OPENLDAP_LIBEXECDIR that causes the following
> build failure:
>
> mv: cannot stat `<build_dir>/bitbake_build/tmp/work/core2-64-wrs-linux/openldap/2.4.39-r0/image/usr/lib64/openldap/slapd': No such file or directory
>
> The base openldat bb installs slapd under ${sbindir}, so LIBEXEC should be
> replaced with sbindir instead of OPENLDAP_LIBEXECDIR. The "run" directory
> is already removed in the base bb, so removing the second time causes this
> build failure:
>
> rmdir: failed to remove `<build_dir>/bitbake_build/tmp/work/core2-64-wrs-linux/openldap/2.4.39-r0/image/var/run': No such file or directory
>
> Finally, ops-base.ldif is needed in the initscript, so we also include it
> in the package.
>
> Signed-off-by: Nam Ninh <nam.ninh@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend b/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend
> index 296e275..63f6064 100644
> --- a/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend
> +++ b/meta-openstack/recipes-support/openldap/openldap_2.4.39.bbappend
> @@ -8,7 +8,7 @@ SRC_URI += "file://ops-base.ldif"
>   LDAP_DN ?= "dc=my-domain,dc=com"
>   LDAP_DATADIR ?= "/etc/openldap-data/"
>
> -OPENLDAP_LIBEXECDIR = "/usr/libexec"
> +OPENLDAP_LIBEXECDIR = "${libexecdir}"
>
>   EXTRA_OECONF += "--libexecdir=${OPENLDAP_LIBEXECDIR}"
>
> @@ -16,11 +16,12 @@ do_install_append() {
>       install -D -m 0755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/openldap
>       sed -i -e 's/%DEFAULT_DN%/${LDAP_DN}/g' ${D}${sysconfdir}/init.d/openldap
>       sed -i -e 's#%LDAP_DATADIR%#${LDAP_DATADIR}#g' ${D}${sysconfdir}/init.d/openldap
> -    sed -i -e 's#%LIBEXEC%#${OPENLDAP_LIBEXECDIR}#g' ${D}${sysconfdir}/init.d/openldap
> +    # Base openldat bb installs slapd under ${sbin}
> +    sed -i -e 's#%LIBEXEC%#${sbindir}#g' ${D}${sysconfdir}/init.d/openldap
>
>       # This is duplicated in /etc/openldap and is for slapd
>       rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
> -    rmdir "${D}${localstatedir}/run"
> +    rm -rf "${D}${localstatedir}/run"
>       rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
>
>       # remove symlinks for backends, recreating in postinstall
> @@ -68,5 +69,5 @@ inherit update-rc.d
>   INITSCRIPT_NAME = "openldap"
>   INITSCRIPT_PARAMS = "defaults"
>
> -FILES_${PN} += "${OPENLDAP_LIBEXECDIR}/*"
> +FILES_${PN} += "${OPENLDAP_LIBEXECDIR}/* ${sysconfdir}/openldap/ops-base.ldif"
>   FILES_${PN}-dbg += "${OPENLDAP_LIBEXECDIR}/openldap/.debug ${OPENLDAP_LIBEXECDIR}/.debug"
>


