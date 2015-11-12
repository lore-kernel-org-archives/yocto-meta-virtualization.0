Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16075E00C2D; Thu, 12 Nov 2015 06:35:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C0465E00C25
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Nov 2015 06:35:38 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.163) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Nov 2015 15:35:35 +0100
Date: Thu, 12 Nov 2015 15:35:35 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20151112143535.GA28678@iapetus.enea.se>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
	<1447296631-16483-2-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1447296631-16483-2-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: bruce.ashfield@windriver.com, meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 2/6] init: no need to close (non-existing) ps file descriptors
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
X-List-Received-Date: Thu, 12 Nov 2015 14:35:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Nov 11, 2015 at 09:50:27PM -0500, Mark Asselstine wrote:
> Attempting to get the status of various daemons which are part of the
> compute image results in an error:
> 
> ps: write error: Bad file descriptor
> 
> Switch to using the more standard io redirection techniques to avoid
> this error.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

Please apply this patch to kilo/fido-kilo too. Thanks!

/Josep

> ---
>  meta-openstack/recipes-devtools/python/python-barbican/barbican.init    | 2 +-
>  .../recipes-devtools/python/python-ceilometer/ceilometer.init           | 2 +-
>  meta-openstack/recipes-devtools/python/python-cinder/cinder-volume      | 2 +-
>  meta-openstack/recipes-devtools/python/python-cinder/cinder.init        | 2 +-
>  meta-openstack/recipes-devtools/python/python-glance/glance.init        | 2 +-
>  meta-openstack/recipes-devtools/python/python-heat/heat.init            | 2 +-
>  meta-openstack/recipes-devtools/python/python-horizon/horizon.init      | 2 +-
>  meta-openstack/recipes-devtools/python/python-keystone/keystone         | 2 +-
>  .../recipes-devtools/python/python-neutron/neutron-agent.init           | 2 +-
>  .../recipes-devtools/python/python-neutron/neutron-server.init          | 2 +-
>  meta-openstack/recipes-devtools/python/python-nova/nova-all             | 2 +-
>  meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth     | 2 +-
>  meta-openstack/recipes-devtools/python/python-nova/nova.init            | 2 +-
>  meta-openstack/recipes-devtools/python/python-rally/rally.init          | 2 +-
>  meta-openstack/recipes-devtools/python/python-trove/trove-init          | 2 +-
>  15 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-barbican/barbican.init b/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
> index 5b353e1..a23a493 100644
> --- a/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
> +++ b/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
> @@ -71,7 +71,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init b/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
> index ba0f426..80fdff5 100644
> --- a/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
> +++ b/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
> @@ -62,7 +62,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume b/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
> index f753810..7d0aa14 100644
> --- a/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
> +++ b/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
> @@ -61,7 +61,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-cinder/cinder.init b/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
> index f130ac8..4c97962 100644
> --- a/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
> +++ b/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
> @@ -63,7 +63,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance.init b/meta-openstack/recipes-devtools/python/python-glance/glance.init
> index 5b1bf74..cbcfb0a 100644
> --- a/meta-openstack/recipes-devtools/python/python-glance/glance.init
> +++ b/meta-openstack/recipes-devtools/python/python-glance/glance.init
> @@ -62,7 +62,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-heat/heat.init b/meta-openstack/recipes-devtools/python/python-heat/heat.init
> index 5e0719f..794ac6a 100644
> --- a/meta-openstack/recipes-devtools/python/python-heat/heat.init
> +++ b/meta-openstack/recipes-devtools/python/python-heat/heat.init
> @@ -68,7 +68,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-horizon/horizon.init b/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
> index 994fbec..be79353 100644
> --- a/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
> +++ b/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
> @@ -58,7 +58,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone b/meta-openstack/recipes-devtools/python/python-keystone/keystone
> index 8953da8..0d8a538 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystone/keystone
> +++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone
> @@ -59,7 +59,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init b/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
> index 8b11a27..c9d8d72 100644
> --- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
> +++ b/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
> @@ -60,7 +60,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init b/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
> index 0c78de6..77f8f01 100644
> --- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
> +++ b/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
> @@ -63,7 +63,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova-all b/meta-openstack/recipes-devtools/python/python-nova/nova-all
> index c1d537d..914b714 100644
> --- a/meta-openstack/recipes-devtools/python/python-nova/nova-all
> +++ b/meta-openstack/recipes-devtools/python/python-nova/nova-all
> @@ -62,7 +62,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth b/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
> index 99f04d5..9a74107 100644
> --- a/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
> +++ b/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
> @@ -48,7 +48,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova.init b/meta-openstack/recipes-devtools/python/python-nova/nova.init
> index 46b28d3..607b6de 100644
> --- a/meta-openstack/recipes-devtools/python/python-nova/nova.init
> +++ b/meta-openstack/recipes-devtools/python/python-nova/nova.init
> @@ -78,7 +78,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-rally/rally.init b/meta-openstack/recipes-devtools/python/python-rally/rally.init
> index e834547..6128e48 100644
> --- a/meta-openstack/recipes-devtools/python/python-rally/rally.init
> +++ b/meta-openstack/recipes-devtools/python/python-rally/rally.init
> @@ -63,7 +63,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> diff --git a/meta-openstack/recipes-devtools/python/python-trove/trove-init b/meta-openstack/recipes-devtools/python/python-trove/trove-init
> index 584bf77..ee0bd21 100644
> --- a/meta-openstack/recipes-devtools/python/python-trove/trove-init
> +++ b/meta-openstack/recipes-devtools/python/python-trove/trove-init
> @@ -73,7 +73,7 @@ status()
>  {
>      pid=`cat $PIDFILE 2>/dev/null`
>      if [ -n "$pid" ]; then
> -        if ps -p $pid >&- ; then
> +        if ps -p $pid > /dev/null 2>&1 ; then
>              echo "$DESC is running"
>              return
>          fi
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

