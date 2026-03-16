# The AdAssociation Entity

> Source: https://advertising.amazon.com/API/docs/en-us/guides/campaign-management/entities/ad-association

Ad associations apply to **Amazon DSP ad groups only** and correspond to ad creative associations in earlier versions of the campaign management API.

> [Technical specification for the AdAssociations resource](https://advertising.amazon.com/API/docs/en-us/amazon-ads/1-0/apis#tag/AdAssociations)

## AdAssociation parameters

**Key:** ✓ required | ○ optional | □ read-only

| Field | Common | DSP |
|-------|--------|-----|
| adAssociationId | □ | □ |
| adGroupId | ✓ | ✓ |
| adId | ✓ | ✓ |
| endDateTime | ○ | ○ |
| startDateTime | ○ | ○ |
| state | ✓ | ✓ |
| weight | ○ | ○ |
