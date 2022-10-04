Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52352C433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 21:07:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.16536.1664917643163219225
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ku8CEYX8;
 spf=pass (domain: gmail.com, ip: 209.85.219.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id z18so9250718qvn.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Oct 2022 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=09mqOlcWuytqGEp3cJ95xSAZt9ALjMqNrek0X6s157E=;
        b=ku8CEYX8nm518AG2dhfUEDEiqQYRNZdkCje1NNSqWqi8lfm3xP/QvxUZDKtcNYAMi4
         vcJaEQUHfIF1zt7nbQIrfDBes3vAyARyOoq37H1aAc2N9TTXywFZkr4SnPBwM4piisdA
         OXHmTxzqunBulfHKCL0QV83G0UH6k10EQaF6hm4liodgWk1sm8jHD9EUr7P/9bNKnq8f
         n6ugaG5H1azj/ccmP8vGhF7mpH8tMXDQsk8sXA1ReU8U9Qpw+1J6s002rPYeintxRJ2z
         8jhx4oatRG314kM/xEbDcfPjMRnfYH0WM1C7qEmgslnVZJl+xcpGk2yQKAcsu1lm6W3N
         dJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=09mqOlcWuytqGEp3cJ95xSAZt9ALjMqNrek0X6s157E=;
        b=fss6mnD49mV4gqVTR7UVtPX4pXJ0+O4V8ez4sNWcDzF4zQn56dZB3lt7R4KmyC0i25
         QDM6izNFteSl8OkR1jahi4LN0i9H3hiNdSlRIv15MAIaYm1A5B8Z2AEmAyfxE6kS3DMI
         HfrSIjzRcSZ8WLo+RlfJJ14fguxBgwg+GXNcIpGs3ocGty+839rWuHnES9zs+qKHMAWv
         +1rI72qErsSfIbXvmLuG8RE4PN5EXM1xLi+YRlbR6X3JykpX+ktFMfZWAXrekpMkk8zY
         FCd0+FNznkgKvKbe6epTeDKWDmg5peHo335tJAwZsmpF4taLLW14brpPjAM2/4y0fhrz
         A91Q==
X-Gm-Message-State: ACrzQf1PJrbEFwG4H/NRx1+5EbyKwOGYwrY9tKfiOmOUNgl680f/F3X5
	TMig6ZUbC3KfVwO37C/nAKtQPVglqXkDfehu
X-Google-Smtp-Source: 
 AMsMyM5Libm1Ro/WtvrS6u2XuyeBcExRd4D23LXKUi8KfpGu43D1TEXjqpOIfHEe7SQvmfCP27lMjQ==
X-Received: by 2002:a05:6214:5287:b0:4b1:c6c0:7c84 with SMTP id
 kj7-20020a056214528700b004b1c6c07c84mr473203qvb.122.1664917641874;
        Tue, 04 Oct 2022 14:07:21 -0700 (PDT)
Received: from gmail.com
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 x9-20020ac87a89000000b0038b684a1642sm1542409qtr.32.2022.10.04.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 14:07:21 -0700 (PDT)
Date: Tue, 4 Oct 2022 17:07:19 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] ceph: fix compile issue
Message-ID: <20221004210717.GA60875@gmail.com>
References: <20220926204516.4819-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926204516.4819-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Oct 2022 21:07:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7640

merged.

Bruce

In message: [meta-virtualization][PATCH] ceph: fix compile issue
on 26/09/2022 sakib.sajal@windriver.com wrote:

> rocksdb has been updated to 7.5.3 in meta-oe causing
> ceph compilation to fail.
> 
> Backport necessary patches to allow ceph to work with
> newer versions rocksdb.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch |  51 +++++
>  ...-reorder-ShardedCache-methods-declar.patch |  70 ++++++
>  ...-define-DeleterFn-function-pointer-t.patch | 101 +++++++++
>  ...-implement-methods-required-by-rocks.patch | 207 ++++++++++++++++++
>  ...05-kv-rocksdb_cache-mark-Shard-const.patch |  32 +++
>  ...006-rocksdb-build-with-rocksdb-7.y.z.patch | 109 +++++++++
>  recipes-extended/ceph/ceph_15.2.15.bb         |   6 +
>  7 files changed, 576 insertions(+)
>  create mode 100644 recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
>  create mode 100644 recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
>  create mode 100644 recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
>  create mode 100644 recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
>  create mode 100644 recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
>  create mode 100644 recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch
> 
> diff --git a/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch b/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
> new file mode 100644
> index 0000000..795c60f
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
> @@ -0,0 +1,51 @@
> +From b7b58010fd10b95c681df78cc4322e6586a39099 Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Tue, 17 Aug 2021 15:20:24 +0800
> +Subject: [PATCH 1/6] kv/rocksdb_cache: drop ROCKSDB_PRIszt
> +
> +ROCKSDB_PRIszt is a macro for "zu", which is in turn use for printing an
> +(unsigned) size_t variable.
> +
> +there is no point having it in the header file or define a macro for it,
> +as %zu is standard compliant, and we don't get any advantage by using a
> +macro for it.
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [44f5b827eb3c65665373a86908bf5d47e7d02687]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +
> +---
> + src/kv/rocksdb_cache/ShardedCache.cc | 2 +-
> + src/kv/rocksdb_cache/ShardedCache.h  | 1 -
> + 2 files changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
> +index 367140a9..8e08deb8 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.cc
> ++++ b/src/kv/rocksdb_cache/ShardedCache.cc
> +@@ -131,7 +131,7 @@ std::string ShardedCache::GetPrintableOptions() const {
> +   char buffer[kBufferSize];
> +   {
> +     std::lock_guard<std::mutex> l(capacity_mutex_);
> +-    snprintf(buffer, kBufferSize, "    capacity : %" ROCKSDB_PRIszt "\n",
> ++    snprintf(buffer, kBufferSize, "    capacity : %zu\n",
> +              capacity_);
> +     ret.append(buffer);
> +     snprintf(buffer, kBufferSize, "    num_shard_bits : %d\n", num_shard_bits_);
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index 4d64893a..8ab2587b 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -22,7 +22,6 @@
> + #ifndef CACHE_LINE_SIZE
> + #define CACHE_LINE_SIZE 64 // XXX arch-specific define 
> + #endif
> +-#define ROCKSDB_PRIszt "zu"
> + 
> + namespace rocksdb_cache {
> + 
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch b/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
> new file mode 100644
> index 0000000..3fc8c86
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
> @@ -0,0 +1,70 @@
> +From 6cdb1387a713fad765b5193d5acf4504f206a66f Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Tue, 17 Aug 2021 15:39:00 +0800
> +Subject: [PATCH 2/6] kv/rocksdb_cache: reorder ShardedCache methods
> + declarations
> +
> +in the exact order in which rocksdb::Cache declare its public virtual
> +methods.
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [633656f8ade2c1d67a66f8b7ca3aa0a2ae82e6b1]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/kv/rocksdb_cache/ShardedCache.h | 21 ++++++++++-----------
> + 1 file changed, 10 insertions(+), 11 deletions(-)
> +
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index 8ab2587b..a16cf561 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -56,34 +56,33 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
> +  public:
> +   ShardedCache(size_t capacity, int num_shard_bits, bool strict_capacity_limit);
> +   virtual ~ShardedCache() = default;
> ++  // rocksdb::Cache
> +   virtual const char* Name() const override = 0;
> +-  virtual CacheShard* GetShard(int shard) = 0;
> +-  virtual const CacheShard* GetShard(int shard) const = 0;
> +-  virtual void* Value(Handle* handle) override = 0;
> +-  virtual size_t GetCharge(Handle* handle) const = 0;
> +-  virtual uint32_t GetHash(Handle* handle) const = 0;
> +-  virtual void DisownData() override = 0;
> +-
> +-  virtual void SetCapacity(size_t capacity) override;
> +-  virtual void SetStrictCapacityLimit(bool strict_capacity_limit) override;
> +-
> +   virtual rocksdb::Status Insert(const rocksdb::Slice& key, void* value, size_t charge,
> +                                  void (*deleter)(const rocksdb::Slice& key, void* value),
> +                                  rocksdb::Cache::Handle** handle, Priority priority) override;
> +   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, rocksdb::Statistics* stats) override;
> +   virtual bool Ref(rocksdb::Cache::Handle* handle) override;
> +   virtual bool Release(rocksdb::Cache::Handle* handle, bool force_erase = false) override;
> ++  virtual void* Value(Handle* handle) override = 0;
> +   virtual void Erase(const rocksdb::Slice& key) override;
> +   virtual uint64_t NewId() override;
> +-  virtual size_t GetCapacity() const override;
> ++  virtual void SetCapacity(size_t capacity) override;
> ++  virtual void SetStrictCapacityLimit(bool strict_capacity_limit) override;
> +   virtual bool HasStrictCapacityLimit() const override;
> ++  virtual size_t GetCapacity() const override;
> +   virtual size_t GetUsage() const override;
> +   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
> +   virtual size_t GetPinnedUsage() const override;
> ++  virtual size_t GetCharge(Handle* handle) const = 0;
> ++  virtual void DisownData() override = 0;
> +   virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +                                       bool thread_safe) override;
> +   virtual void EraseUnRefEntries() override;
> +   virtual std::string GetPrintableOptions() const override;
> ++  virtual CacheShard* GetShard(int shard) = 0;
> ++  virtual const CacheShard* GetShard(int shard) const = 0;
> ++  virtual uint32_t GetHash(Handle* handle) const = 0;
> + 
> +   int GetNumShardBits() const { return num_shard_bits_; }
> + 
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch b/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
> new file mode 100644
> index 0000000..01144b7
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
> @@ -0,0 +1,101 @@
> +From 29f1e556c1e7c5ab195983552387e1410e0b5b6c Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Tue, 17 Aug 2021 16:25:32 +0800
> +Subject: [PATCH 3/6] kv/rocksdb_cache: define DeleterFn function pointer type
> +
> +this paves the road to rocksdb v6.22.1 compatible implementation
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [c7a6c74b62dfcc96f676eb6d8844852c4705b66f]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/kv/rocksdb_cache/BinnedLRUCache.cc | 2 +-
> + src/kv/rocksdb_cache/BinnedLRUCache.h  | 4 ++--
> + src/kv/rocksdb_cache/ShardedCache.cc   | 2 +-
> + src/kv/rocksdb_cache/ShardedCache.h    | 6 ++++--
> + 4 files changed, 8 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +index 2391a7f6..4e5f4dd4 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +@@ -344,7 +344,7 @@ bool BinnedLRUCacheShard::Release(rocksdb::Cache::Handle* handle, bool force_era
> + 
> + rocksdb::Status BinnedLRUCacheShard::Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
> +                              size_t charge,
> +-                             void (*deleter)(const rocksdb::Slice& key, void* value),
> ++                             DeleterFn deleter,
> +                              rocksdb::Cache::Handle** handle, rocksdb::Cache::Priority priority) {
> +   auto e = new BinnedLRUHandle();
> +   rocksdb::Status s;
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +index 96023ce2..b0fb7148 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +@@ -56,7 +56,7 @@ std::shared_ptr<rocksdb::Cache> NewBinnedLRUCache(
> + 
> + struct BinnedLRUHandle {
> +   void* value;
> +-  void (*deleter)(const rocksdb::Slice&, void* value);
> ++  DeleterFn deleter;
> +   BinnedLRUHandle* next_hash;
> +   BinnedLRUHandle* next;
> +   BinnedLRUHandle* prev;
> +@@ -189,7 +189,7 @@ class alignas(CACHE_LINE_SIZE) BinnedLRUCacheShard : public CacheShard {
> +   // Like Cache methods, but with an extra "hash" parameter.
> +   virtual rocksdb::Status Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
> +                         size_t charge,
> +-                        void (*deleter)(const rocksdb::Slice& key, void* value),
> ++                        DeleterFn deleter,
> +                         rocksdb::Cache::Handle** handle,
> +                         rocksdb::Cache::Priority priority) override;
> +   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, uint32_t hash) override;
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
> +index 8e08deb8..ef3b3b98 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.cc
> ++++ b/src/kv/rocksdb_cache/ShardedCache.cc
> +@@ -44,7 +44,7 @@ void ShardedCache::SetStrictCapacityLimit(bool strict_capacity_limit) {
> + }
> + 
> + rocksdb::Status ShardedCache::Insert(const rocksdb::Slice& key, void* value, size_t charge,
> +-                            void (*deleter)(const rocksdb::Slice& key, void* value),
> ++                            DeleterFn deleter,
> +                             rocksdb::Cache::Handle** handle, Priority priority) {
> +   uint32_t hash = HashSlice(key);
> +   return GetShard(Shard(hash))
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index a16cf561..674e5322 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -25,6 +25,8 @@
> + 
> + namespace rocksdb_cache {
> + 
> ++using DeleterFn = void (*)(const rocksdb::Slice& key, void* value);
> ++
> + // Single cache shard interface.
> + class CacheShard {
> +  public:
> +@@ -33,7 +35,7 @@ class CacheShard {
> + 
> +   virtual rocksdb::Status Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
> +                                  size_t charge,
> +-                                 void (*deleter)(const rocksdb::Slice& key, void* value),
> ++                                 DeleterFn deleter,
> +                                  rocksdb::Cache::Handle** handle, rocksdb::Cache::Priority priority) = 0;
> +   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, uint32_t hash) = 0;
> +   virtual bool Ref(rocksdb::Cache::Handle* handle) = 0;
> +@@ -59,7 +61,7 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
> +   // rocksdb::Cache
> +   virtual const char* Name() const override = 0;
> +   virtual rocksdb::Status Insert(const rocksdb::Slice& key, void* value, size_t charge,
> +-                                 void (*deleter)(const rocksdb::Slice& key, void* value),
> ++                                 DeleterFn,
> +                                  rocksdb::Cache::Handle** handle, Priority priority) override;
> +   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, rocksdb::Statistics* stats) override;
> +   virtual bool Ref(rocksdb::Cache::Handle* handle) override;
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch b/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
> new file mode 100644
> index 0000000..ee1e141
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
> @@ -0,0 +1,207 @@
> +From 90696cb3652eb307c6aadde4af7d9198dc00c15f Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Tue, 17 Aug 2021 16:27:47 +0800
> +Subject: [PATCH 4/6] kv/rocksdb_cache: implement methods required by rocksdb
> + v6.22.1
> +
> +rocksdb v6.22.1 added couple pure methods, so let's implement them.
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [2c445598ce5280e85feb1f0e94d1940a444ee421]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/kv/rocksdb_cache/BinnedLRUCache.cc | 26 +++++++++++++++++++++++---
> + src/kv/rocksdb_cache/BinnedLRUCache.h  | 14 +++++++++++---
> + src/kv/rocksdb_cache/ShardedCache.cc   | 25 ++++++++++++++++++++++++-
> + src/kv/rocksdb_cache/ShardedCache.h    | 20 ++++++++++++++++++--
> + 4 files changed, 76 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +index 4e5f4dd4..1e6ba7af 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +@@ -150,13 +150,20 @@ void BinnedLRUCacheShard::EraseUnRefEntries() {
> +   }
> + }
> + 
> +-void BinnedLRUCacheShard::ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +-                                           bool thread_safe) {
> ++void BinnedLRUCacheShard::ApplyToAllCacheEntries(
> ++  const std::function<void(const rocksdb::Slice& key,
> ++                           void* value,
> ++                           size_t charge,
> ++                           DeleterFn)>& callback,
> ++  bool thread_safe)
> ++{
> +   if (thread_safe) {
> +     mutex_.lock();
> +   }
> +   table_.ApplyToAllCacheEntries(
> +-      [callback](BinnedLRUHandle* h) { callback(h->value, h->charge); });
> ++    [callback](BinnedLRUHandle* h) {
> ++      callback(h->key(), h->value, h->charge, h->deleter);
> ++    });
> +   if (thread_safe) {
> +     mutex_.unlock();
> +   }
> +@@ -463,6 +470,12 @@ std::string BinnedLRUCacheShard::GetPrintableOptions() const {
> +   return std::string(buffer);
> + }
> + 
> ++DeleterFn BinnedLRUCacheShard::GetDeleter(rocksdb::Cache::Handle* h) const
> ++{
> ++  auto* handle = reinterpret_cast<BinnedLRUHandle*>(h);
> ++  return handle->deleter;
> ++}
> ++
> + BinnedLRUCache::BinnedLRUCache(CephContext *c, 
> +                                size_t capacity, 
> +                                int num_shard_bits,
> +@@ -518,6 +531,13 @@ void BinnedLRUCache::DisownData() {
> + #endif  // !__SANITIZE_ADDRESS__
> + }
> + 
> ++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++DeleterFn BinnedLRUCache::GetDeleter(Handle* handle) const
> ++{
> ++  return reinterpret_cast<const BinnedLRUHandle*>(handle)->deleter;
> ++}
> ++#endif
> ++
> + size_t BinnedLRUCache::TEST_GetLRUSize() {
> +   size_t lru_size_of_all_shards = 0;
> +   for (int i = 0; i < num_shards_; i++) {
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +index b0fb7148..ba0c2720 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +@@ -205,13 +205,19 @@ class alignas(CACHE_LINE_SIZE) BinnedLRUCacheShard : public CacheShard {
> +   virtual size_t GetUsage() const override;
> +   virtual size_t GetPinnedUsage() const override;
> + 
> +-  virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +-                                      bool thread_safe) override;
> ++  virtual void ApplyToAllCacheEntries(
> ++    const std::function<void(const rocksdb::Slice& key,
> ++                             void* value,
> ++                             size_t charge,
> ++                             DeleterFn)>& callback,
> ++    bool thread_safe) override;
> + 
> +   virtual void EraseUnRefEntries() override;
> + 
> +   virtual std::string GetPrintableOptions() const override;
> + 
> ++  virtual DeleterFn GetDeleter(rocksdb::Cache::Handle* handle) const override;
> ++
> +   void TEST_GetLRUList(BinnedLRUHandle** lru, BinnedLRUHandle** lru_low_pri);
> + 
> +   //  Retrieves number of elements in LRU, for unit test purpose only
> +@@ -303,7 +309,9 @@ class BinnedLRUCache : public ShardedCache {
> +   virtual size_t GetCharge(Handle* handle) const override;
> +   virtual uint32_t GetHash(Handle* handle) const override;
> +   virtual void DisownData() override;
> +-
> ++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++  virtual DeleterFn GetDeleter(Handle* handle) const override;
> ++#endif
> +   //  Retrieves number of elements in LRU, for unit test purpose only
> +   size_t TEST_GetLRUSize();
> +   // Sets the high pri pool ratio
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
> +index ef3b3b98..6cbd89ad 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.cc
> ++++ b/src/kv/rocksdb_cache/ShardedCache.cc
> +@@ -109,13 +109,36 @@ size_t ShardedCache::GetPinnedUsage() const {
> +   return usage;
> + }
> + 
> ++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++DeleterFn ShardedCache::GetDeleter(Handle* handle) const
> ++{
> ++  uint32_t hash = GetHash(handle);
> ++  return GetShard(Shard(hash))->GetDeleter(handle);
> ++}
> ++
> ++void ShardedCache::ApplyToAllEntries(
> ++    const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
> ++                             DeleterFn deleter)>& callback,
> ++    const ApplyToAllEntriesOptions& opts)
> ++{
> ++  int num_shards = 1 << num_shard_bits_;
> ++  for (int s = 0; s < num_shards; s++) {
> ++    GetShard(s)->ApplyToAllCacheEntries(callback, true /* thread_safe */);
> ++  }
> ++}
> ++#else
> + void ShardedCache::ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +                                           bool thread_safe) {
> +   int num_shards = 1 << num_shard_bits_;
> +   for (int s = 0; s < num_shards; s++) {
> +-    GetShard(s)->ApplyToAllCacheEntries(callback, thread_safe);
> ++    GetShard(s)->ApplyToAllCacheEntries(
> ++      [callback](const rocksdb::Slice&, void* value, size_t charge, DeleterFn) {
> ++        callback(value, charge);
> ++      },
> ++      thread_safe);
> +   }
> + }
> ++#endif
> + 
> + void ShardedCache::EraseUnRefEntries() {
> +   int num_shards = 1 << num_shard_bits_;
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index 674e5322..4d3ca302 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -14,6 +14,7 @@
> + #include <string>
> + #include <mutex>
> + 
> ++#include "rocksdb/version.h"
> + #include "rocksdb/cache.h"
> + #include "include/ceph_hash.h"
> + #include "common/PriorityCache.h"
> +@@ -45,10 +46,15 @@ class CacheShard {
> +   virtual void SetStrictCapacityLimit(bool strict_capacity_limit) = 0;
> +   virtual size_t GetUsage() const = 0;
> +   virtual size_t GetPinnedUsage() const = 0;
> +-  virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +-                                      bool thread_safe) = 0;
> ++  virtual void ApplyToAllCacheEntries(
> ++    const std::function<void(const rocksdb::Slice& key,
> ++                             void* value,
> ++                             size_t charge,
> ++                             DeleterFn)>& callback,
> ++    bool thread_safe) = 0;
> +   virtual void EraseUnRefEntries() = 0;
> +   virtual std::string GetPrintableOptions() const { return ""; }
> ++  virtual DeleterFn GetDeleter(rocksdb::Cache::Handle* handle) const = 0;
> + };
> + 
> + // Generic cache interface which shards cache by hash of keys. 2^num_shard_bits
> +@@ -77,9 +83,19 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
> +   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
> +   virtual size_t GetPinnedUsage() const override;
> +   virtual size_t GetCharge(Handle* handle) const = 0;
> ++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++  virtual DeleterFn GetDeleter(Handle* handle) const override;
> ++#endif
> +   virtual void DisownData() override = 0;
> ++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++  virtual void ApplyToAllEntries(
> ++      const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
> ++                               DeleterFn deleter)>& callback,
> ++      const ApplyToAllEntriesOptions& opts) override;
> ++#else
> +   virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
> +                                       bool thread_safe) override;
> ++#endif
> +   virtual void EraseUnRefEntries() override;
> +   virtual std::string GetPrintableOptions() const override;
> +   virtual CacheShard* GetShard(int shard) = 0;
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch b/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
> new file mode 100644
> index 0000000..bc18574
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
> @@ -0,0 +1,32 @@
> +From 52c57e25a5e2c617bc797b8ce50060b5894bd7fc Mon Sep 17 00:00:00 2001
> +From: Kefu Chai <kchai@redhat.com>
> +Date: Tue, 17 Aug 2021 18:06:31 +0800
> +Subject: [PATCH 5/6] kv/rocksdb_cache: mark Shard() const
> +
> +it does not mutate anything, so mark it `const`.
> +
> +Signed-off-by: Kefu Chai <kchai@redhat.com>
> +
> +Upstream-Status: Backport [0296ac4458c0be0609f033e15b0fa8c6c9c20049]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/kv/rocksdb_cache/ShardedCache.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index 4d3ca302..f98421a0 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -136,7 +136,7 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
> + //    return Hash(s.data(), s.size(), 0);
> +   }
> + 
> +-  uint32_t Shard(uint32_t hash) {
> ++  uint32_t Shard(uint32_t hash) const {
> +     // Note, hash >> 32 yields hash in gcc, not the zero we expect!
> +     return (num_shard_bits_ > 0) ? (hash >> (32 - num_shard_bits_)) : 0;
> +   }
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch b/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch
> new file mode 100644
> index 0000000..c7ca704
> --- /dev/null
> +++ b/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch
> @@ -0,0 +1,109 @@
> +From 06f23837c757ff7a8aa8db4e5965e25e9ca69f45 Mon Sep 17 00:00:00 2001
> +From: "Kaleb S. KEITHLEY" <kkeithle@redhat.com>
> +Date: Mon, 23 May 2022 07:41:26 -0400
> +Subject: [PATCH 6/6] rocksdb: build with rocksdb-7.y.z
> +
> +RocksDB 7, specifically 7.2.2 has landed in Fedora 37/rawhide.
> +
> +https://tracker.ceph.com/issues/55730
> +
> +Signed-off-by: Kaleb S. KEITHLEY <kkeithle@redhat.com>
> +(cherry picked from commit eea10281e6f4078f261b05b6bd9c9c9aec129201)
> +
> +Upstream-Status: Backport [be3ca10e60ade9dbe7d3e5cb018f32c7cc97e2ed]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/kv/RocksDBStore.cc                 | 7 ++-----
> + src/kv/rocksdb_cache/BinnedLRUCache.cc | 2 +-
> + src/kv/rocksdb_cache/BinnedLRUCache.h  | 2 +-
> + src/kv/rocksdb_cache/ShardedCache.cc   | 2 +-
> + src/kv/rocksdb_cache/ShardedCache.h    | 4 ++--
> + 5 files changed, 7 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/kv/RocksDBStore.cc b/src/kv/RocksDBStore.cc
> +index 328277e5..115d28fc 100644
> +--- a/src/kv/RocksDBStore.cc
> ++++ b/src/kv/RocksDBStore.cc
> +@@ -728,19 +728,16 @@ int64_t RocksDBStore::estimate_prefix_size(const string& prefix,
> + {
> +   auto cf = get_cf_handle(prefix);
> +   uint64_t size = 0;
> +-  uint8_t flags =
> +-    //rocksdb::DB::INCLUDE_MEMTABLES |  // do not include memtables...
> +-    rocksdb::DB::INCLUDE_FILES;
> +   if (cf) {
> +     string start = key_prefix + string(1, '\x00');
> +     string limit = key_prefix + string("\xff\xff\xff\xff");
> +     rocksdb::Range r(start, limit);
> +-    db->GetApproximateSizes(cf, &r, 1, &size, flags);
> ++    db->GetApproximateSizes(cf, &r, 1, &size);
> +   } else {
> +     string start = combine_strings(prefix , key_prefix);
> +     string limit = combine_strings(prefix , key_prefix + "\xff\xff\xff\xff");
> +     rocksdb::Range r(start, limit);
> +-    db->GetApproximateSizes(default_cf, &r, 1, &size, flags);
> ++    db->GetApproximateSizes(default_cf, &r, 1, &size);
> +   }
> +   return size;
> + }
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +index 1e6ba7af..c4918355 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
> +@@ -531,7 +531,7 @@ void BinnedLRUCache::DisownData() {
> + #endif  // !__SANITIZE_ADDRESS__
> + }
> + 
> +-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
> + DeleterFn BinnedLRUCache::GetDeleter(Handle* handle) const
> + {
> +   return reinterpret_cast<const BinnedLRUHandle*>(handle)->deleter;
> +diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +index ba0c2720..266667f0 100644
> +--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
> ++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
> +@@ -309,7 +309,7 @@ class BinnedLRUCache : public ShardedCache {
> +   virtual size_t GetCharge(Handle* handle) const override;
> +   virtual uint32_t GetHash(Handle* handle) const override;
> +   virtual void DisownData() override;
> +-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
> +   virtual DeleterFn GetDeleter(Handle* handle) const override;
> + #endif
> +   //  Retrieves number of elements in LRU, for unit test purpose only
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
> +index 6cbd89ad..7d160f9c 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.cc
> ++++ b/src/kv/rocksdb_cache/ShardedCache.cc
> +@@ -109,7 +109,7 @@ size_t ShardedCache::GetPinnedUsage() const {
> +   return usage;
> + }
> + 
> +-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
> + DeleterFn ShardedCache::GetDeleter(Handle* handle) const
> + {
> +   uint32_t hash = GetHash(handle);
> +diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
> +index f98421a0..855912d7 100644
> +--- a/src/kv/rocksdb_cache/ShardedCache.h
> ++++ b/src/kv/rocksdb_cache/ShardedCache.h
> +@@ -83,11 +83,11 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
> +   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
> +   virtual size_t GetPinnedUsage() const override;
> +   virtual size_t GetCharge(Handle* handle) const = 0;
> +-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
> +   virtual DeleterFn GetDeleter(Handle* handle) const override;
> + #endif
> +   virtual void DisownData() override = 0;
> +-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
> ++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
> +   virtual void ApplyToAllEntries(
> +       const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
> +                                DeleterFn deleter)>& callback,
> +-- 
> +2.33.0
> +
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index f2ece8c..14b4c97 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -17,6 +17,12 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
>             file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
>             file://CVE-2021-3979.patch \
> +           file://0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch \
> +           file://0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch \
> +           file://0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch \
> +           file://0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch \
> +           file://0005-kv-rocksdb_cache-mark-Shard-const.patch \
> +           file://0006-rocksdb-build-with-rocksdb-7.y.z.patch \
>  "
>  
>  SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7630): https://lists.yoctoproject.org/g/meta-virtualization/message/7630
> Mute This Topic: https://lists.yoctoproject.org/mt/93936539/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


