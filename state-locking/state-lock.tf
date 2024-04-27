resource "time_sleep" "state_lock" {
    depends_on = [time_sleep.state_unlock]
    create_duration = "5m"
}

resource "time_sleep" "state_unlock" {
    create_duration = "0s"
}