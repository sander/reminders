script AppDelegate
    property textField : missing value
    property calendarTitle : missing value
    property datePicker : missing value
    property theWindow : missing value
    property theCal : current application's class "NSCalendar"'s currentCalendar
    property theCalendarUid : "580BCAD1-FA83-4621-969E-97A5F2C9F60B"

    on addToCalendar_(sender)
        set theDate to dateFromDateValue(datePicker's dateValue)
        set theSummary to textField's stringValue as string
        
        tell application "Calendar"
            set theCalendar to first calendar whose uid is theCalendarUid
            tell theCalendar to make new event at end with properties {start date:theDate, allday event:true, summary:theSummary}
        end tell
    end
    
    to dateFromDateValue(dateValue)
        set theDate to date "0:00"
        tell theCal's components_fromDate_(254, dateValue)
            set theDate's day to |day|()
            set theDate's month to |month|()
            set theDate's year to |year|()
        end tell
        theDate
    end

    to dateValueFromDate(aDate)
        set theComponents to theCal's components_fromDate_(254, datePicker's dateValue)
        tell theComponents
            setYear_(aDate's year)
            setMonth_(aDate's month as integer)
            setDay_(aDate's day)
        end
        theCal's dateFromComponents_(theComponents)
    end

    on awakeFromNib()
        theWindow's makeFirstResponder_(textField)
        set datePicker's dateValue to dateValueFromDate(current date)
        tell application "Calendar"
            set theCalendar to first calendar whose uid is theCalendarUid
            set calendarTitle's stringValue to theCalendar's name
        end tell
    end awakeFromNib
end script